class Sport < ApplicationRecord
  has_many :users_sports
  has_many :users, through: :users_sports
end
