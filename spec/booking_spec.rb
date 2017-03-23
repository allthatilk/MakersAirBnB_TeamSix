describe Booking do

  let(:booking) {Booking.create(date: "22.03.2017", space_id: "12")}
  let(:user) { User.create(email: 'test@example.com', password: "password")}


  it "can create a new booking" do
    booking
    expect(Booking.all.count).to eq 1
  end

  it "is unapproved by default" do
    expect(booking.is_approved).to be false
  end

  it "can be approved" do
    expect{booking.approve}.to change {booking.is_approved}
  end

  describe 'booking requests' do
    let(:my_space) { Space.create(name: "Two-bedroom", description: "Spacious flat in Kingston", price: 70, user_id: 1) }

    it "can give us the booking requests for a user's spaces" do
      my_space
      booking_for_my_space = Booking.create(date: Date.today, space_id: 1)
      all_bookings_for_all_spaces = Booking.requests_by_space(Space.all(id: 1))
      all_bookings_for_my_space = all_bookings_for_all_spaces[0]
      expect(all_bookings_for_my_space.first).to eql booking_for_my_space
    end

    it "will display 0 booking requests if there are none" do
      my_space
      booking_requests = Booking.requests_by_space(Space.all(id: 1))
      expect(booking_requests.flatten.length).to eq 0
    end

  end
end
