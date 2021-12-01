class AddUserReferenceToTrips < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :trips, :users
    add_index :trips, :user_id
    change_column_null :trips, :user_id, false
  end
end
