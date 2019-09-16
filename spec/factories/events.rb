FactoryBot.define do
  factory :event do
    name { Faker::Movie.quote }
    start_at { "2019-09-01 18:00:00" }
    alloted_tickets { 10 }
    sold_out_tickets { 0 }
    price { 100 }
  end
end
