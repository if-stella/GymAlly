class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.references :user_one, foreign_key: { to_table: :users }
      t.references :user_two, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
