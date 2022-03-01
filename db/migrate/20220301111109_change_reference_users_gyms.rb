class ChangeReferenceUsersGyms < ActiveRecord::Migration[6.1]
  def change
    remove_reference :gyms, :user, index: true
    add_reference :users, :gym, index: true
  end
end
