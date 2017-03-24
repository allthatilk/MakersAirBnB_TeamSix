class Booking

  include DataMapper::Resource

  property :id, Serial
  property :date, DateTime
  property :is_approved, Boolean, default: false

  # belongs_to :user
  belongs_to :space

  def approve
    self.update(is_approved: true)
  end

  def self.make(space, date)
    Booking.create(date: date, space_id: space.id) if space.available_on_date?(date)
  end

  def self.requests_by_space(spaces)
    requests = []
    spaces.each {|space|
      unapproved_bookings = Booking.all(space_id: space.id, is_approved: false)
      requests << unapproved_bookings unless unapproved_bookings.empty? }
    requests
  end

end
