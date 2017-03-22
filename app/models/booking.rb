class Booking

  include DataMapper::Resource

  property :id, Serial
  property :date, DateTime

  # belongs_to :user
  belongs_to :space

  def self.make(space, date)
    Booking.create(date: date, space_id: space.id) if space.available_on_date?(date)
  end

end
