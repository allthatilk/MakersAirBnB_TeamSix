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
end
