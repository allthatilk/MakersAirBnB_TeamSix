class Space

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, String
  property :price, Integer

  has n, :bookings

  def available_tonight?
    Booking.all(space_id: id, date: Date.today).empty?
  end

end
