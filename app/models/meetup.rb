class Meetup < ApplicationRecord
  belongs_to :friendship
  belongs_to :sport, optional: true
  has_one :user_one, through: :friendship
  has_one :user_two, through: :friendship
  def start_time
    self.date
  end
end
