class Weekday < ApplicationRecord
  has_many :users_days
  has_many :users, through: :users_days
end
