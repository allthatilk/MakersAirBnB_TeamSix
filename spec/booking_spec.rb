describe Booking do

  let(:booking) {Booking.create(date: "22.03.2017", space_id: "12")}

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

  it "can give us the booking requests for a user's spaces" do
    the_space = Space.create(name: "Two-bedroom", description: "Spacious flat in Kingston", price: 70)
    the_booking = Booking.create(date: Date.today, space_id: 1)
    expect(Booking.requests_by_space(Space.all(id: 1))[0].first).to eql the_booking
  end
end
