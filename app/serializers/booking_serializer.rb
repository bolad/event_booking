class BookingSerializer < ActiveModel::Serializer
  attributes :id, :price, :tickets

  belongs_to :user
  belongs_to :event
end
