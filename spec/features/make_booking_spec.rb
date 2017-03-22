feature "making a booking" do
  scenario "user can select a date and request a booking for that date" do
    visit "/"
    create_joy_room_listing
    click_link "The Joy Room"
    fill_in("date", with: Date.today.strftime("%Y-%m-%d"))
    expect {click_button("Make a booking")}.to change(Booking, :count).by(1)
    expect(page).to have_content("Booking successfully made")
  end
end