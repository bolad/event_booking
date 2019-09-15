# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :reduce_tickets
  after_destroy :release_tickets

  def compute_purchace_price(amount, tickets)
    amount * tickets
  end

  private

  def release_tickets
    tickets_to_release = tickets

    event = self.event

    event.update(
      sold_out_tickets: event.sold_out_tickets - tickets_to_release
    )
  end

  def reduce_tickets
    consumable_tickets = tickets
    event = self.event

    event.update(
      sold_out_tickets: event.sold_out_tickets + consumable_tickets
    )
  end
end
