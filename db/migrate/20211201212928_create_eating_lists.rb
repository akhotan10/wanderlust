class CreateEatingLists < ActiveRecord::Migration[6.0]
  def change
    create_table :eating_lists do |t|
      t.integer :trip_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
