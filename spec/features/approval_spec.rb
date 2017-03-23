feature 'booking request approval' do
  scenario 'user can visit dashboard and approve pending booking requests' do
    visit "/"
    sign_up
    create_joy_room_listing
    Booking.create(date: "2017-03-03", space_id: 1)
    click_link "Visit Dashboard"
    click_button "Approve"
    expect(page).to have_content "Request for The Joy Room approved"
  end
end
