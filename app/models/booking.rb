class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event

private

def release_tickets
end

def reduce_tickets
end
end
