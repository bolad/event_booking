# frozen_string_literal: true

class Api::BookingsController < ApplicationController
  before_action :set_event
  before_action :check_ticket_availability

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    if @booking.valid?
      begin
        payment = Adapters::Payment::Gateway.charge(
          amount: @booking.compute_purchace_price(gateway_params[:amount].to_i, @booking.tickets),
          token: gateway_params[:token],
          currency: gateway_params[:currency]
        )

        @booking.price = payment.amount
        @booking.save

        render json: @booking, status: :created
      rescue Adapters::Payment::Gateway::CardError => e
        Rails.logger.info("Booking failed for #{e.message}")
        render json: { error: e.message }, status: :unprocessable_entity
      rescue Adapters::Payment::Gateway::PaymentError => e
        Rails.logger.info("Booking failed for #{e.message}")
        render json: { error: e.message }, status: :unprocessable_entity
      end

    else
      render json: { message: 'Could not process your booking.' }, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:bookings).permit(:tickets, :event_id)
  end

  def gateway_params
    params.require(:bookings).permit(:amount, :token, :currency)
  end

  def set_event
    @event = Event.find(booking_params[:event_id])
  end

  def check_ticket_availability

    if @event.alloted_tickets == @event.sold_out_tickets
      render(json: { error: 'Event sold out' }, status: :unprocessable_entity) && return
    end
  end
end
