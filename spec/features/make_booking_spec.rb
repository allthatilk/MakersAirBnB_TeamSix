feature "making a booking" do
  let!(:user) do
    User.create(email: 'test@test.com',
    password: 'password')
  end

  scenario "user can select a date and request a booking for that date" do
<<<<<<< HEAD
    sign_in(email: 'test@test.com', password: 'password')
=======
    sign_in()
>>>>>>> 5db96d4227022167c54c71ee94adb901af63483f
    visit "/"
    create_joy_room_listing
    click_link "The Joy Room"
    fill_in("date", with: Date.today.strftime("%Y-%m-%d"))
    expect {click_button("Make a booking")}.to change(Booking, :count).by(1)
    expect(page).to have_content("Booking successfully made")
  end

  scenario "user can only make a booking whilst logged in" do
    visit '/'
    expect(page).not_to have_selector("input", :id =>"bookingbutton")
  end
end
