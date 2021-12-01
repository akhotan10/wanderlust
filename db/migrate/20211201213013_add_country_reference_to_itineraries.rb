class AddCountryReferenceToItineraries < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :itineraries, :countries
    add_index :itineraries, :country_id
    change_column_null :itineraries, :country_id, false
  end
end
