class Api::EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy, :available_tickets ]

  def show
    render json: @event
  end

  def index
    @events = Event.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    render json: @events, status: :ok
  end
  
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :ok
    else    
      render json: @event.errors, status: :unprocessable_entity  
    end
  end

  def update  
    if @event.update(event_params)    
      render json: @event, status: :ok
    else    
        render json: @event.errors, status: :unprocessable_entity  
    end
  end 

  def destroy  
    @event.destroy
    head :no_content
  end

  def available_tickets
    available_tickets = @event.alloted_tickets - @event.sold_out_tickets
    render json: { available_tickets: available_tickets.negative? ? 0 : available_tickets }
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :price, :start_at, :alloted_tickets, :sold_out_tickets)
  end
end
