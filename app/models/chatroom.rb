class Chatroom < ApplicationRecord
  belongs_to :friendship
  has_many :messages
end
