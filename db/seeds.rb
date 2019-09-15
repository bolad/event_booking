# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.create!(name: 'Wroclaw HipHop Festival', start_at: Time.now, alloted_tickets: 500, sold_out_tickets: 0)
User.create!(email: "test@example.com", full_name: "Michael Phelps")
