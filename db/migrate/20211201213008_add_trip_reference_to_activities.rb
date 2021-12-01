class AddTripReferenceToActivities < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :activities, :trips
    add_index :activities, :trip_id
    change_column_null :activities, :trip_id, false
  end
end
