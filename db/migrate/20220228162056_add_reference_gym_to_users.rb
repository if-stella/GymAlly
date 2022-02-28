class AddReferenceGymToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :gyms, :user, index: true
  end
end
