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
#create 4 different customer users.
4.times do |x|
  User.create(email:"user#{x}@email.com", password: 'password', user_type: 'customer', name:Faker::Name.name )
end

5.times do |x|
  User.create(email:"restaurant_user#{x}@email.com", password: 'password', user_type: 'customer', name:Faker::Name.name )
end

csv_text = File.read('./db/venues_df.csv')
csv = CSV.parse(csv_text, headers: true)

csv.each do |row|
  owner = User.find_by_email("restaurant_user#{rand(0..5)}@email.com")
  Restaurant.create(name: Faker::Restaurant.name, cuisine: Faker::Restaurant.type, details: Faker::Restaurant.description, longitude: row['lng'], latitude: row['lat'], user: owner, address: "somewhere")
end
