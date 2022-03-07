class CreateMeetups < ActiveRecord::Migration[6.1]
  def change
    create_table :meetups do |t|
      t.references :friendship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
