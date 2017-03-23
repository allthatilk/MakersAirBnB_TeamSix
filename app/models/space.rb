class Space

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, String
  property :price, Integer

  has n, :bookings

  belongs_to :user

  def available_tonight?
    available_on_date?(Date.today)
  end

  def available_on_date?(date)
    Booking.all(space_id: id, date: date, is_approved: true).empty?
  end

  def get_unavailable_dates
    all_approved_bookings = Booking.all(space_id: id, is_approved: true)
    unavailable_dates = []
    all_approved_bookings.each do |booking|
      unavailable_date = [booking.date.strftime('%d').to_i, booking.date.strftime('%m').to_i, booking.date.strftime('%Y').to_i]
      unavailable_dates << unavailable_date
    end
    unavailable_dates
  end



end
