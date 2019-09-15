class Api::EventsController < ApplicationController
  before_action :set_event, only: [:show, :available_tickets ]

  def show
    render json: @event
  end

  def index
    @events = Event.all
    render json: @events, status: :ok
  end

  def available_tickets
    available_tickets = @event.alloted_tickets - @event.sold_out_tickets
    render json: { available_tickets: available_tickets < 0 ? 0 : available_tickets }
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
