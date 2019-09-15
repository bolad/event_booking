FactoryBot.define do
  factory :booking do
    user
    event
    tickets { 3 }
  end
end
