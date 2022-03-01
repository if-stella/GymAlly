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

puts 'Finished!'

 require 'faker'

 User.destroy_all

 puts 'Creating 25 fake users...'
 25.times do
   user = User.new(
     nickname: Faker::Internet.username(5..8),
     age: rand(18..39),
     email: Faker::Internet.safe_email,
     gender: Faker::Gender.type,
     quote: Faker::Hipster.sentence
   )
    user.gym = Gym.all.sample
    user.save!
 end
 puts 'Finished with the users!'
