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
Meetup.destroy_all
Friendship.destroy_all
User.destroy_all
Chatroom.destroy_all
Weekday.destroy_all
Sport.destroy_all
UsersSport.destroy_all

puts 'Creating gyms...'
# Gym.destroy_all
Gym.create([{ name: 'Fitness First Pankow', address: "Wilhelm-Kuhr-Straße 9, Berlin", city: 'Berlin' },
            { name: 'John Reed Mitte', address: "Prenzlauer Allee 248, Berlin", city: 'Berlin' },
            { name: 'McFIT Wedding', address: "Seestraße 64, Berlin", city: 'Berlin' },
            { name: 'FitX Friedrichshain', address: "Alexanderstraße 7, Berlin", city: 'Berlin' },
            { name: 'Fit Star Moabit', address: "Turmstraße 29, Berlin", city: 'Berlin' }])

# User.destroy_all
puts "creating all sports"
Sport.create([{ name: 'Running' }, { name: 'Weights' }, { name: 'Boxing' }, { name: 'Cycling' }, { name: 'Swimming' }, { name: 'Arms/Chest' }, { name: 'Yoga' }, { name: 'Legs/Bum' }, { name: 'Cardio' }, { name: 'Crossfit' }, { name: 'Core' }, { name: 'MMA' }])
puts "creating all dayssss"
Weekday.create([{ name: 'Monday' }, { name: 'Tuesday' }, { name: 'Wednesday' }, { name: 'Thursday' }, { name: 'Friday' }, { name: 'Saturday' }, { name: 'Sunday' }])

puts 'Creating 20 fake users...'
20.times do
  user = User.new(
    nickname: Faker::Internet.username(specifier: 4..10),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(18..39),
    email: Faker::Internet.safe_email,
    gender: ["male", "female", "divers"].sample,
    quote: Faker::Quote.famous_last_words,
    password: "123456"
  )

  i = rand(1..3)
  user.sports = Sport.all.sample(i)
  e = rand(1..7)
  user.weekdays = Weekday.all.sample(e)

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
    nickname: "KingKang",
    email: "kang@hsieh.com",
    password: "123456",
    gender: "male",
    gym: Gym.first,
    photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1644365606/m65osr9oba87mizlpeov.jpg"
  },
  {
    first_name: "Stella",
    last_name: "Raab",
    nickname: "Stellarrr",
    email: "stella@raab.com",
    password: "123456",
    gender: "female",
    gym: Gym.first,
    photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1645091330/omqwqvmntdbhfss8avjh.jpg"
  },
  {
    first_name: "Lydia",
    nickname: "miss-alles",
    last_name: "Alles",
    email: "lydia@alles.com",
    password: "123456",
    gender: "female",
    gym: Gym.last,
    photo_url: "https://avatars.githubusercontent.com/u/96770546?v=4"
  },
  {
    first_name: "Ida",
    last_name: "Schwarzkopf",
    nickname: "Ida-isda",
    email: "ida@schwarzkopf.com",
    password: "123456",
    gender: "female",
    gym: Gym.last,
    photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1641681283/u5sc2fa7h5ykddrzyrv0.jpg"
  }
]

admins.each do |admin|
  file = URI.open(admin[:photo_url])
  user = User.create(
    first_name: admin[:first_name],
    last_name: admin[:last_name],
    nickname: admin[:nickname],
    email: admin[:email],
    age: 25,
    gender: admin[:gender],
    password: "123456",
    quote: Faker::Quote.famous_last_words,
    gym: Gym.first
  )
  i = rand(1..3)
  user.sports = Sport.all.sample(i)
  e = rand(1..7)
  user.weekdays = Weekday.all.sample(e)
  # user.gym = Gym.all.sample
  user.location = user.gym.city
  user.photo.attach(io: file, filename: "#{user.first_name}.png", content_type: 'image/png')
  user.save
end

puts 'Finished with the users!'

puts 'Creating one friendship and one chatroom'
kang = User.find_by(first_name: "Kang")
lydia = User.find_by(first_name: "Lydia")
ida = User.find_by(first_name: "Ida")
stella = User.find_by(first_name: "Stella")
friendship_one = Friendship.create(user_one: kang, user_two: lydia, status: "accepted")
friendship_two = Friendship.create(user_one: kang, user_two: stella, status: "accepted")
Chatroom.create(friendship: friendship_one)
Chatroom.create(friendship: friendship_two)

puts "Seed finished"
