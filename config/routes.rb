Rails.application.routes.draw do
  namespace :api do
    resources :events, only: [:show, :index] do
      get 'available-tickets', action: :available_tickets, on: :member
    end
    resources :sessions, only: [:create]
    resources :registration, only: [:create]
    delete :logout, to: "sessions#logout"
    get :logged_in, to: "sessions#logged_in"

    resources :bookings, only: [:create]
  end

end
