class CreateUsersWeekdays < ActiveRecord::Migration[6.1]
  def change
    create_table :users_weekdays do |t|
      t.references :weekday, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
