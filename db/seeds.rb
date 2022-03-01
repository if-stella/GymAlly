# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts "creating gyms..."
# Gym.destroy_all
# gym = Gym.create([{ name: 'McFit Hellersdorf' }, { name: 'JohnReed Gesundbrunnen' }, { name: 'McFit Kurfürstendamm' }, { name: 'SuperFit Alexa' }, { name: 'FitnessFirst Pankow' }, { name: 'FitX Schöneberg' }, { name: 'JohnReed Prenzlauer Berg' }])
# gym.save!
# puts "created new seeds"


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

###### KANG's PART for TESTS (DELETE, WHEN ACTUAL SEED CONFIG IS DONE) ###################

puts "Destroying gyms and users"
Gym.destroy_all
User.destroy_all

puts "Creating new gyms and users"
gym = Gym.new(name: "mcfit", city: "berlin")
kang = User.create(email: "kang@hsieh.com", password: "123456", gym: gym)
kang.save
lydia = User.create(email: "lydia@alles.com", password: "123456", gym: gym)
lydia.save

puts "Seed finished"
