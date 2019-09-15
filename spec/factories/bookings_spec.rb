FactoryBot.define do
  factory :booking do
    user
    event
    tickets { 10 }
  end
end
