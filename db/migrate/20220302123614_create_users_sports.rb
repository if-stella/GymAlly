class CreateUsersSports < ActiveRecord::Migration[6.1]
  def change
    create_table :users_sports do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
