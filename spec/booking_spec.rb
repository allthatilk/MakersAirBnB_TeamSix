describe Booking do
  it "can create a new booking" do
    Booking.create(date: "10/12/2017", space_id: "11")
    expect(Booking.all.count).to eq 1
  end
end
