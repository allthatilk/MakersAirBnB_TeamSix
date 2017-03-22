feature 'User sign up' do
  scenario 'Users can sign up to use the site' do
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test@example.com')
    expect(User.first.email).to eq('test@example.com')
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
    sign_in(email: user.email, password: user.password_digest)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  scenario "User can click Sign in button on the main page" do
    visit '/'
    find_link('Sign In')
  end

end
