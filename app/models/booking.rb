class Booking

  include DataMapper::Resource

  property :id, Serial
  property :date, DateTime

  # belongs_to :user
  belongs_to :space

end
