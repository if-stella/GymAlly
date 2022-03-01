# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all

puts 'Creating 25 fake users...'
25.times do
  user = User.new(
    username: Faker::Internet.username(5..8),
    age: rand(18..39),
    email: Faker::Internet.safe_email,
    gender: Faker::Gender.type,
    quote: Faker::Hipster.sentence
  )
  user.save!
end
puts 'Finished with the users!'
