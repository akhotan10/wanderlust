class AddTripReferenceToHighlights < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :highlights, :trips
    add_index :highlights, :trip_id
    change_column_null :highlights, :trip_id, false
  end
end
