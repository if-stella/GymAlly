class AddStatusToMeetups < ActiveRecord::Migration[6.1]
  def change
    add_column :meetups, :meetup_status, :string
  end
end
