class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_at, :alloted_tickets, :sold_out_tickets

  has_many :bookings
  has_many :users
end
