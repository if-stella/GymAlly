class RemoveSportsFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :sport
  end
end
