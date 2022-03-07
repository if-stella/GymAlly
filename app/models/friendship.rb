class Friendship < ApplicationRecord
  belongs_to :user_one, class_name: "User"
  belongs_to :user_two, class_name: "User"
  has_one :chatroom, dependent: :destroy
  has_many :meetups, dependent: :destroy
end
