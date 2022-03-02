# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

puts "Destroying users, gyms, friendships, chatrooms..."
Gym.destroy_all
User.destroy_all
Friendship.destroy_all
Chatroom.destroy_all

puts 'Creating gyms...'
# Gym.destroy_all
Gym.create([{ name: 'McFit Hellersdorf', city: 'Berlin' },
            { name: 'JohnReed Gesundbrunnen', city: 'Berlin' },
            # { name: 'McFit Kurfürstendamm', city: 'Berlin' },
            # { name: 'SuperFit Alexa', city: 'Berlin' },
            # { name: 'FitnessFirst Pankow', city: 'Berlin'},
            # { name: 'FitX Schöneberg', city: 'Berlin' },
            { name: 'JohnReed Prenzlauer Berg', city: 'Berlin' }])

# User.destroy_all

puts 'Creating 10 fake users...'
10.times do
  user = User.new(
    nickname: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(18..39),
    email: Faker::Internet.safe_email,
    gender: ["male", "female", "divers"].sample,
    quote: Faker::Hipster.sentence,
    password: "123456",
    sport: ["Fitness", "Bodybuilding", "Cycling", "Cardio"].sample
  )
  file = URI.open('https://i.pravatar.cc/80')
  user.photo.attach(io: file, filename: "#{user.first_name}.png", content_type: 'image/png')
  user.gym = Gym.all.sample
  user.location = user.gym.city
  user.save!
end

puts 'Creating 4 admin users'

admins = [
  {
    first_name: "Kang",
    last_name: "Hsieh",
    email: "kang@hsieh.com",
    password: "123456",
    gender: "male",
    gym: Gym.first,
    photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1644365606/m65osr9oba87mizlpeov.jpg"
  },
  {
    first_name: "Stella",
    last_name: "Raab",
    email: "stella@raab.com",
    password: "123456",
    gender: "female",
    gym: Gym.first,
    photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1645091330/omqwqvmntdbhfss8avjh.jpg"
  },
  {
    first_name: "Lydia",
    last_name: "Alles",
    email: "lydia@alles.com",
    password: "123456",
    gender: "female",
    gym: Gym.first,
    photo_url: "https://avatars.githubusercontent.com/u/96770546?v=4"
  },
  {
    first_name: "Ida",
    last_name: "Schwarzkopf",
    email: "ida@schwarzkopf.com",
    password: "123456",
    gender: "female",
    gym: Gym.first,
    photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641681283/u5sc2fa7h5ykddrzyrv0.jpg"
  }
]

admins.each do |admin|
  file = URI.open(admin[:photo_url])
  user = User.create(
    first_name: admin[:first_name],
    last_name: admin[:last_name],
    email: admin[:email],
    age: 12,
    gender: admin[:gender],
    password: "123456",
    quote: Faker::Hipster.sentence,
    gym: Gym.first,
    sport: ["Fitness", "Bodybuilding", "Cycling", "Cardio"].sample
  )
  user.location = user.gym.city
  user.photo.attach(io: file, filename: "#{user.first_name}.png", content_type: 'image/png')
  user.save
end

# kang = User.create(first_name: "Kang",
#                    last_name: "Hsieh",
#                    email: "kang@hsieh.com",
#                    password: "123456",
#                    gym: Gym.first)
# kang.photo.attach(io: file, filename: "#{kang.first_name}.png", content_type: 'image/png')
# kang.save
# stella = User.create(first_name: "Stella",
#                      last_name: "Raab",
#                      email: "stella@raab.com",
#                      password: "123456",
#                      gym: Gym.first)
# stella.save
# lydia = User.create(first_name: "Lydia",
#                     last_name: "Alles",
#                     email: "lydia@alles.com",
#                     password: "123456",
#                     gym: Gym.first)
# lydia.save
# ida = User.create(first_name: "Ida",
#                   last_name: "Schwarzkopf",
#                   email: "ida@schwarzkopf.com",
#                   password: "123456",
#                   gym: Gym.first)
# ida.save

puts 'Finished with the users!'

puts 'Creating one friendship and one chatroom'
kang = User.find_by(first_name: "Kang")
lydia = User.find_by(first_name: "Lydia")
friendship = Friendship.create(user_one: kang, user_two: lydia)
chatroom = Chatroom.create(friendship: friendship)

puts "Seed finished"
