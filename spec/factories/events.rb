FactoryBot.define do
  factory :event do
    name { Faker::Movie.quote }
    start_at { Time.now }
    alloted_tickets { 10 }
    sold_out_tickets { 0 }
    price { 50 }
  end
end
