class AddSenderToMeetups < ActiveRecord::Migration[6.1]
  def change
    add_column :meetups, :sender, :string
    add_column :meetups, :date, :datetime
    add_reference :meetups, :sport, index: true
  end
end
