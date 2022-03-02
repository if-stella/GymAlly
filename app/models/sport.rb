class Sport < ApplicationRecord
  has_many :users_sport
  has_many :users, through: :users_sport
end
