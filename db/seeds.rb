# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
require 'csv'
require 'geocoder'
#create 4 different customer users.
4.times do |x|
  User.create(email:"user#{x}@email.com", password: 'password', user_type: 'customer', name:Faker::Name.name )
end

5.times do |x|
  User.create(email:"restaurant_user#{x}@email.com", password: 'password', user_type: 'restaurant', name:Faker::Name.name )
end

csv_text = File.read('./db/venues_df.csv')
csv = CSV.parse(csv_text, headers: true)

csv.each do |row|
  owner = User.find_by_email("restaurant_user#{rand(0..5)}@email.com")
  geo_localization = "#{row['venue_lat']},#{row['venue_lng']}"
  query = Geocoder.search(geo_localization).first
  Restaurant.create(name: Faker::Restaurant.name, cuisine: ['American', 'Italian', 'Mexican', 'Indian', 'Chinese'].sample, details: Faker::Restaurant.description, user: owner, address: query.address)
end

5.times do |x|
  User.create(email:"restaurant_user#{x}@email.com", password: 'password', user_type: 'customer', name:Faker::Name.name )
end
(1..3).each do |x|
  user = User.find_by_email("user#{x}@email.com")
  5.times do |x|
    Booking.create(user: user, restaurant_id: x, accepted: false, completed: false)

  end

end
