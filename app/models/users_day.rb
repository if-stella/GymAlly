class UsersDay < ApplicationRecord
  belongs_to :day
  belongs_to :user
end
