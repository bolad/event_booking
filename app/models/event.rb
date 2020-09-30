class Event < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings

  has_one_attached :photo

  validates :name, presence: true
  validates :start_at, presence: true
end
