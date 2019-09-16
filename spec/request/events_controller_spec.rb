require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET show" do
    let(:event) { create(:event) }
    let(:tickets) { 4 }
    let(:user) { create(:user) }

    it 'displays all events' do
      get "/api/events", headers: { "X-User-Email": user.email }

      expect(response).to be_ok
    end

    it 'checks available tickets for query' do
      post "/api/bookings/",
        params: {
          bookings: {
            event_id: event.id,
            tickets: tickets,
            amount: event.price,
            currency: "EUR",
            token: :payment_done
          },
          format: :json
        },
        headers: {"X-User-Email": user.email }

        get "/api/events/#{event.id}/available-tickets",
          params: { format: :json },
          headers: { "X-User-Email": user.email }

        expect(response).to be_ok
        expect(json['available_tickets']).to eq(6)
    end

    it 'renders event info' do
      get "/api/events/#{event.id}",
        params: { format: :json },
        headers: { "X-User-Email": user.email }

        expect(response).to be_ok
        expect(json['id']).to eq(event.id)
        expect(json['name']).to eq(event.name)
        expect(json['alloted_tickets']).to eq(10)
        expect(json['sold_out_tickets']).to eq(0)
    end
  end
end
