feature 'User sign up' do
  scenario 'Users can sign up to use the site' do
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('test@test.com')
    expect(User.first.email).to eq('test@test.com')
  end

# Currently this feature is not integral to the product. To test it would
# require extra set up with poltergeist and phantom js that may affect our
# use of Capybara as this would require testing the javascript file
  # scenario 'Users can show their password' do
  #   visit '/users/new'
  #   fill_in :password, with: 'password'
  #   check('toggle')
  #   # expect(page).to have_selector('password', visible: true )
  #   puts page.html
  #   expect(page).to have_css('input[type="password"][id="password"]')
  # end
  #
  # scenario 'Users can hide their password' do
  #   visit '/users/new'
  #   fill_in :password, with: 'password'
  #
  # end
end

feature 'User sign in' do
  let!(:user) do
    User.create(email: 'test@test.com',
    password: 'password')
  end

  scenario 'Users can sign in with correct credentials' do
    sign_up
    sign_in
    expect(page).to have_content "#{user.email}"
  end

  scenario "User can click Sign in button on the main page" do
    visit '/'
    find_link('Sign In')
  end

  scenario "User can't sign in with the wrong credentials" do
    visit 'sessions/new'
    fill_in :email, with: 'wrong@email.com'
    fill_in :password, with: 'wrongpassword'
    click_button 'Sign in'
    expect(page).to have_content "The email or password is incorrect"
  end

end

feature "user sign out" do
  scenario "user can sign out" do
    sign_up
    click_button 'Sign out'
    expect(page).not_to have_content "Welcome, test@test.com"
  end
end

feature "limiting guest access" do
  scenario "guest users can't add a new listing" do
    visit '/'
    expect(page).not_to have_selector("input", :id =>"listingbutton")
  end
end

feature "user email validation" do
  scenario "users must provide an email address to sign up" do
    expect { sign_up("") }.not_to change(User, :count)
  end
end

feature "password validation" do
  scenario "users must provide a password to sign up" do
    expect { sign_up("email@example.com", "")}.not_to change{User.all.length}
  end
end

feature "unique email validation" do
  scenario "users can't sign up twice" do
    sign_up
    expect { sign_up }.not_to change{User.all.length}
  end

  scenario "users can't sign up twice" do
    sign_up
    sign_up
    expect(page).to have_content "Sorry, this user already exists"
  end
end
