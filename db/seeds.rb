# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating gyms...'
Gym.destroy_all
gym = Gym.create([{ name: 'McFit Hellersdorf', city: 'Berlin' }, { name: 'JohnReed Gesundbrunnen', city: 'Berlin' }, { name: 'McFit Kurfürstendamm', city: 'Berlin' }, { name: 'SuperFit Alexa', city: 'Berlin' }, { name: 'FitnessFirst Pankow' , city: 'Berlin'}, { name: 'FitX Schöneberg', city: 'Berlin' }, { name: 'JohnReed Prenzlauer Berg', city: 'Berlin' }])
#gym.save
puts 'Finished!'


################## STELLA's PART ########################
# require 'faker'

# User.destroy_all

# puts 'Creating 25 fake users...'
# 25.times do
#   user = User.new(
#     username: Faker::Internet.username(5..8),
#     age: rand(18..39),
#     email: Faker::Internet.safe_email,
#     gender: Faker::Gender.type,
#     quote: Faker::Hipster.sentence
#   )
#   user.save!
# end
# puts 'Finished with the users!'

# puts "Destroying gyms and users"
# Gym.destroy_all
# User.destroy_all

# Gym.destroy_all
# Gym.create(name: "gym", city: "Berlin")
# puts 'Creating 25 fake users...'
# 25.times do
#   user = User.new(
#     nickname: Faker::Internet.username(5..8),
#     age: rand(18..39),
#     email: Faker::Internet.safe_email,
#     gender: Faker::Gender.type,
#     quote: Faker::Hipster.sentence,
#     location: "Berlin",
#     password: "123456",
#     gym: Gym.first,
#     sport: ["basketball", "football", "fitness"].sample
#   )
#   user.save!
# end
# puts 'Finished with the users!'

###### KANG's PART for TESTS (DELETE, WHEN ACTUAL SEED CONFIG IS DONE) ###################

puts "Creating new gyms and users"
gym = Gym.new(name: "mcfit", city: "berlin")

kang = User.create(first_name: "Kang", last_name: "Hsieh", email: "kang@hsieh.com", password: "123456", gym: gym)
kang.save
lydia = User.create(first_name: "Lydia", last_name: "Alles", email: "lydia@alles.com", password: "123456", gym: gym)
lydia.save

puts "Seed finished"
