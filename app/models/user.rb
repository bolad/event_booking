class User < ApplicationRecord
  has_many :bookings
  has_many :events, through: :bookings
end
