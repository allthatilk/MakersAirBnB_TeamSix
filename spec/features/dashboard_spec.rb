feature 'dashboard' do
  scenario 'displays a booking request for one of your properties, with the booked date' do
    visit "/"
    sign_up
    create_joy_room_listing
    Booking.create(date: "2017-03-03", space_id: 1)
    click_link "Visit Dashboard"
    expect(page).to have_content "1 Booking Request"
    expect(page).to have_content "Joy Room requested on 03/03/2017"
  end

  scenario 'you can accept a booking request' do

  end

  scenario 'you can reject a booking request' do

  end
end
