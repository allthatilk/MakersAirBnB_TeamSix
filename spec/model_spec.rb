describe Space do
  it "can create a new space" do
    Space.create(name: "Two-bedroom", description: "Spacious flat in Kingston", price: 70)
    expect(Space.all.count).to eq 1
  end
end
