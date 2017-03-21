feature 'User sign up' do
  scenario 'Users can sign up to use the site' do
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test@example.com')
    expect(User.first.email).to eq('test@example.com')
  end
end
