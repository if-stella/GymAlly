class AddLocationToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :location, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :nickname, :string
    add_column :users, :quote, :string
    add_column :users, :sport, :string
  end
end
