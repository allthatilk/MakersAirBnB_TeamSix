feature 'booking request approval' do
  let(:booking) { Booking.create(date: "2017-03-03", space_id: 1) }
  scenario 'user can visit dashboard and approve pending booking requests' do
    visit "/"
    sign_up
    create_joy_room_listing
    booking
    click_link "Visit Dashboard"
    click_button "Approve"
    expect(page).to have_content "Request for The Joy Room approved"
  end

  scenario 'user can visit dashboard and reject pending booking requests' do
    sign_up
    create_joy_room_listing
    booking
    click_link "Visit Dashboard"
    click_button "Reject"
    expect(page).to have_content "Request for The Joy Room rejected"
  end
end
