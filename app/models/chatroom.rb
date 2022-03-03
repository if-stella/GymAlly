class Chatroom < ApplicationRecord
  belongs_to :friendship
  has_many :messages, dependent: :destroy
  has_one :user_one, through: :friendship
  has_one :user_two, through: :friendship
end
