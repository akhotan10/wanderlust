class AddTripReferenceToItineraries < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :itineraries, :trips
    add_index :itineraries, :trip_id
    change_column_null :itineraries, :trip_id, false
  end
end
