require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validations' do
    it "should validate the presence of attributes" do
      user = build :user, full_name: nil, email: nil
      expect(user).not_to be_valid
      expect(user.errors.messages[:full_name]).to include("can't be blank")
      expect(user.errors.messages[:email]).to include("can't be blank")
    end

    it "should validate the uniqueness of user's attributes" do
      user1 = create :user
      user2 = build :user, full_name: user1.full_name, email: user1.email
      expect(user2).not_to be_valid

      user2.full_name = "Mike Plein"
      user2.email = "plein@gmail.com"
      expect(user2).to be_valid
    end
  end
end
