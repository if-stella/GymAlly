class CreateUsersDays < ActiveRecord::Migration[6.1]
  def change
    create_table :users_days do |t|
      t.references :day, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
