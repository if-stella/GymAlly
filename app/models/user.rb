class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  scope :filter_by_location, ->(location) { where(location: location) }
  scope :filter_by_age1, ->(age1) { where("age >= #{age1}") }
  scope :filter_by_age2, ->(age2) { where("age <= #{age2}") }
  scope :filter_by_gender, ->(gender) { where(gender: gender) }
  scope :filter_by_sport, ->(sports) { where(sport: sports) }
  scope :filter_by_nickname, ->(nickname) { where(nickname: nickname) }
  scope :filter_by_gym, ->(gym) { where(gym: gym) }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friendships_as_user_one, class_name: "Friendship", foreign_key: :user_one_id
  has_many :friendships_as_user_two, class_name: "Friendship", foreign_key: :user_two_id
  has_many :messages
  belongs_to :gym
  # def filter_by_location(location)
  #   where(location: location)
  # end

  # def filter_by_age(ages)
  #   where(age: ages)
  # end

  # def filter_by_sport(sport)
  #   where(sport: sport)
  # end

  # def filter_by_nickname(nickname)
  #   where(nickname: nickname)
  # end

  # def filter_by_gender(gender)
  #   where(gender: gender)
  # end
end
