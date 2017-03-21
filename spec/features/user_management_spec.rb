feature 'User sign up' do
  scenario 'Users can sign up to use the site' do
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test@example.com')
    expect(User.first.email).to eq('test@example.com')
  end

  # scenario 'Users can show their password' do
  #   visit '/users/new'
  #   fill_in :password, with: 'password'
  #   check('toggle')
  #   expect(page).to have_selector('password', visible: true )
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

end
