describe Space do
  let(:user) { User.create(email: 'test@example.com', password: "password")}
  let(:my_space) { Space.create(name: "Two-bedroom", description: "Spacious flat in Kingston", price: 70, user_id: 1) }
  let(:booking) { Booking.create(date: Date.today, space_id: 1) }

  it "can create a new space" do
    my_space
    expect(Space.all.count).to eq 1
  end

  it "knows if it's available tonight" do
    expect(my_space.available_tonight?).to be true
  end

  it "knows if it's unavailable tonight" do
    booking
    expect(my_space.available_tonight?).to be false
  end

  it "knows if it's available on a given date" do
    expect(my_space.available_on_date?(Date.today)).to be true
  end

  it "knows if it's unavailable on a given date" do
    booking
    expect(my_space.available_on_date?(Date.today)).to be false
  end

  it "shows unavailable dates for a space" do
    booking = Booking.create(date: "2017-03-22", space_id: 1)
    expect(my_space.get_unavailable_dates).to eq [[22, 3, 2017]]
  end
end
