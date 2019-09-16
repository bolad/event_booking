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

    it 'attempts to buy 2 tickets with a failed payment' do
      post "/api/bookings",
        params: {
          bookings: {
            event_id: event.id,
            tickets: tickets,
            amount: event.price,
            currency: "EUR",
            token: :payment_error
          },
          format: :json
        },
        headers: { "X-User-Email": user.email }

      expect(response).to be_unprocessable
      expect(json["error"]).to eq("Something went wrong with your transaction.")
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it 'attempts to by 2 tickets with an invalid card' do
      post "/api/bookings",
        params: {
          bookings: {
            event_id: event.id,
            tickets: tickets,
            amount: event.price,
            currency: "EUR",
            token: :card_error
          },
          format: :json
        },
        headers: { "X-User-Email": user.email }

      expect(response).to be_unprocessable
      expect(json["error"]).to eq("Your card has been declined.")
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it 'attempts to buy tickets for an unknown event' do
      expect {
        post "/api/bookings",
        params: {
          bookings: {
            event_id: "58858584884",
            tickets: tickets,
            amount: event.price,
            currency: "EUR",
            token: :payment_done
          },
          format: :json
        },
        headers: { "X-User-Email": user.email }
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'buys 2 tickets from an event' do
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

      expect(response).to be_created
      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(json['id']).to be_present
      expect(json['price']).to eq(event.price * tickets)
      expect(json["tickets"]).to eq(tickets)
    end
  end
end
