class CreateItineraries < ActiveRecord::Migration[6.0]
  def change
    create_table :itineraries do |t|
      t.integer :country_id
      t.integer :trip_id

      t.timestamps
    end
  end
end
