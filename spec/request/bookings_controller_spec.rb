require 'rails_helper'

RSpec.describe "Event bookings", type: :request do
  describe "POST create" do
    let(:event) { create(:event) }
    let(:tickets) { 2 }
    let(:user) { create(:user) }

    it 'attempt to buy sold out tickets' do
      event.bookings.create(user_id: user.id, price: 1000, tickets: 10)

      post "/api/bookings",
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
        headers: { "X-User-Email": user.email }

        expect(response).to be_unprocessable
        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(json['error']).to eq("Event sold out")
    end
  end
end
