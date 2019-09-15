class Api::BookingsController < ApplicationController
  before_action :set_event
  before_action :check_ticket_availability

  def create
  end

  private

  def booking_params
    params.require(:bookings).permit(:tickets, :event_id)
  end

  def set_event
    @event = Event.find(booking_params[:event_id])
  end

  def check_ticket_availability
    if @event.alloted_tickets == @event.sold_out_tickets
      render(json: { error: "Event sold out"}, status: :unprocessable_entity) and return
    end
  end

end
