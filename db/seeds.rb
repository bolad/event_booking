# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event
  .create!(name: 'One Love Reggae', start_date: '15th January 2021', start_time: '08:00 PM', price: 100, alloted_tickets: 500, sold_out_tickets: 0)
  .image.attach(io: File.open('/Users/bolad/Downloads/music.jpg'), filename: 'music')

Event
  .create!(name: 'Tech Meet Up', start_date: '20th July 2021', start_time: '09:30 AM', price: 70, alloted_tickets: 200, sold_out_tickets: 0)
  .image.attach(io: File.open('/Users/bolad/Downloads/tech.jpg'), filename: 'tech')

Event
.create!(name: 'Walk Of Justice', start_date: '10th April 2022', start_time: '02:15 PM', price: 10, alloted_tickets: 1000, sold_out_tickets: 0)
.image.attach(io: File.open('/Users/bolad/Downloads/blm2.jpg'), filename: 'blm', filename: 'blm')

Event
.create!(name: 'Chalewote Festival', start_date: '5th November 2022', start_time: '06:15 PM', price: 10, alloted_tickets: 750, sold_out_tickets: 0)
.image.attach(io: File.open('/Users/bolad/Downloads/art2.jpg'), filename: 'art')

Event
.create!(name: 'Soccer Fiesta', start_date: '10th October 2023', start_time: '01:00 PM', price: 50, alloted_tickets: 100, sold_out_tickets: 0)
.image.attach(io: File.open('/Users/bolad/Downloads/soccer.jpg'), filename: 'soccer')

Event
.create!(name: 'Rails Girls Conf', start_date: '12th June 2021', start_time: '09:15 AM', price: 150, alloted_tickets: 250, sold_out_tickets: 0)
.image.attach(io: File.open('/Users/bolad/Downloads/girl-code.jpg'), filename: 'code')


