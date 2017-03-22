describe Space do

  it "can create a new space" do
    Space.create(name: "Two-bedroom", description: "Spacious flat in Kingston", price: 70)
    expect(Space.all.count).to eq 1
  end

  it "knows if it's available tonight" do
    my_space = Space.create(name: "Two-bedroom", description: "Spacious flat in Kingston", price: 70)
    expect(my_space.available_tonight?).to be true
  end

  it "knows if it's unavailable tonight" do
    my_space = Space.create(name: "Two-bedroom", description: "Spacious flat in Kingston", price: 70)
    booking = Booking.create(date: Date.today, space_id: 1)
    expect(my_space.available_tonight?).to be false
  end

  it "knows if it's available on a given date" do
    my_space = Space.create(name: "Two-bedroom", description: "Spacious flat in Kingston", price: 70)
    expect(my_space.available_on_date?(Date.today)).to be true
  end

  it "knows if it's unavailable on a given date" do
    my_space = Space.create(name: "Two-bedroom", description: "Spacious flat in Kingston", price: 70)
    booking = Booking.create(date: Date.today, space_id: 1)
    expect(my_space.available_on_date?(Date.today)).to be false
  end

  it "shows unavailable dates for a space" do
    my_space = Space.create(name: "Two-bedroom", description: "Spacious flat in Kingston", price: 70)
    booking = Booking.create(date: Date.today, space_id: 1)
    expect(my_space.get_unavailable_dates).to eq [[21, 03, 2017]]
  end
end
