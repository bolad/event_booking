class Event < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings

  has_one_attached :image

  validates :name, presence: true
end
