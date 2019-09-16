Rails.application.routes.draw do
  namespace :api do
    resources :events, only: [:show, :index] do
      get 'available-tickets', action: :available_tickets, on: :member
    end

    resources :bookings, only: [:create]
  end
end
