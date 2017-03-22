feature 'adding a space' do
  let!(:user) do
    User.create(email: 'test@test.com',
    password: 'password')
  end

  scenario 'I can add a space' do
    sign_in()
    visit "/"
    create_joy_room_listing
    expect(page).to have_content("The Joy Room")
  end
end
