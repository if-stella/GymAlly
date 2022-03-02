class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :days, :weekday, :name
  end
end
