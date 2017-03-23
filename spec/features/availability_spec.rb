feature 'space availability' do
  let!(:user) do
    User.create(email: 'test@test.com',
    password: 'password')
  end

  scenario 'seeing a space\'s availability tonight' do
    sign_in()
    visit "/"
    sign_in
    create_joy_room_listing
    click_link "The Joy Room"
    expect(page).to have_content("Available Tonight!")
  end
end

feature 'filtering' do
  let!(:user) do
    User.create(email: 'test@test.com',
    password: 'password')
  end

  scenario 'filter the spaces list by availability' do
    sign_in()
    p "pay attention"
    visit "/"
    create_joy_room_listing
    create_jims_room_listing
    Booking.create(date: Date.today, space_id: 2)
    fill_in("date", with: Date.today.strftime("%Y-%m-%d"))
    p Booking.get(1)
    click_button "See Available Spaces"
    expect(page).to have_content("The Joy Room")
    expect(page).to_not have_content("Jim's Room")
    p "look away"
  end

end
