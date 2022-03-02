class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.string :weekday

      t.timestamps
    end
  end
end
