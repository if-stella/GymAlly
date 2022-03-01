# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying users"
User.destroy_all
Gym.destroy_all

puts "creating gym"
gym = Gym.create(name: "Mcfit", city: "Berlin")
puts "creating users"
kang = User.create(email: "kang@hsieh.com")
kang.gym = gym
kang.save
lydia = User.create(email: "lydia@alles.com")
lydia.gym = gym
lydia.save

puts "user seeds created"
