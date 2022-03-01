# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Gym.destroy_all
User.destroy_all
Friendship.destroy_all
Chatroom.destroy_all

puts 'Creating gyms...'
# Gym.destroy_all
Gym.create([{ name: 'McFit Hellersdorf', city: 'Berlin' }, { name: 'JohnReed Gesundbrunnen', city: 'Berlin' }, { name: 'McFit Kurfürstendamm', city: 'Berlin' }, { name: 'SuperFit Alexa', city: 'Berlin' }, { name: 'FitnessFirst Pankow' , city: 'Berlin'}, { name: 'FitX Schöneberg', city: 'Berlin' }, { name: 'JohnReed Prenzlauer Berg', city: 'Berlin' }])

require 'faker'

# User.destroy_all

puts 'Creating 25 fake users...'
25.times do
  user = User.new(
    nickname: Faker::Internet.username(5..8),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(18..39),
    email: Faker::Internet.safe_email,
    gender: ["male", "female", "divers"].sample,
    quote: Faker::Hipster.sentence,
    password: "123456",
    sport: ["Fitness", "Bodybuilding", "Cycling", "Cardio"].sample
  )
  user.gym = Gym.all.sample
  user.save!
end

puts 'Creating 4 admin users'
kang = User.create(first_name: "Kang", last_name: "Hsieh", email: "kang@hsieh.com", password: "123456", gym: Gym.first)
kang.save
lydia = User.create(first_name: "Lydia", last_name: "Alles", email: "lydia@alles.com", password: "123456", gym: Gym.first)
lydia.save

puts 'Finished with the users!'

puts 'Creating one friendship and one chatroom'
friendship = Friendship.create(user_one: kang, user_two: lydia)
chatroom = Chatroom.create(friendship: friendship)

puts "Seed finished"
