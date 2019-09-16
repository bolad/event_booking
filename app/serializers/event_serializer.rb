class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :alloted_tickets, :sold_out_tickets, :start_date, :start_time

  has_many :bookings
  has_many :users

  def start_date
    object.start_at.strftime("%d.%m.%Y")
  end

  def start_time
    object.start_at.strftime("%I:%M%p")
  end

end
