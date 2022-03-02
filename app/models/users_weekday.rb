class UsersWeekday < ApplicationRecord
  belongs_to :weekday
  belongs_to :user
end
