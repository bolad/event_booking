Rails.application.routes.draw do
  root 'welcome#index'
  namespace :api do

    resources :events, only: [:show, :index, :create, :update, :destroy] do
      get 'available-tickets', action: :available_tickets, on: :member
    end
    resources :sessions, only: [:create]
    resources :registrations, only: [:create]
    delete :logout, to: "sessions#logout"
    get :logged_in, to: "sessions#logged_in"

    resources :bookings, only: [:create]

    default_url_options :host => "localhost:3001"
  end
end