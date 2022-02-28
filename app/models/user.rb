class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :friendships_as_user_one, class_name: "Friendship", foreign_key: :user_one_id
  has_many :friendships_as_user_two, class_name: "Friendship", foreign_key: :user_two_id
  has_many :messages
  has_one :gym
end
