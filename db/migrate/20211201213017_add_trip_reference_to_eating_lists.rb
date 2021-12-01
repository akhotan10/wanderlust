class AddTripReferenceToEatingLists < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :eating_lists, :trips
    add_index :eating_lists, :trip_id
    change_column_null :eating_lists, :trip_id, false
  end
end
