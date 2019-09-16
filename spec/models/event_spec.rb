require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#validations' do
    it "should validate the presence of a name" do
      event = build :event, name: ''
      expect(event).not_to be_valid
      expect(event.errors.messages[:name]).to include("can't be blank")
    end

    it "should validate the presence of a start date and time" do
      event = build :event, start_at: ''
      expect(event).not_to be_valid
      expect(event.errors.messages[:start_at]).to include("can't be blank")
    end

  end

end
