class AddSportToMeetups < ActiveRecord::Migration[6.1]
  def change
    add_reference :meetups, :sport, null: false, foreign_key: true
  end
end
