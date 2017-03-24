feature 'add listing' do

  let!(:user) do
    User.create(email: 'test@test.com',
    password: 'password')
  end

  scenario 'user can visit a page to create listing' do
    sign_in
    click_button('Create a new listing')
    expect(page).to have_content('Create a new listing')
  end

  scenario 'user can add a new listing' do
    sign_in
    click_button('Create a new listing')
    create_joy_room_listing
    expect(Space.all.count).to eq 1
  end
end
