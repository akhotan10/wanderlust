class AddRestaurantReferenceToEatingLists < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :eating_lists, :restaurants
    add_index :eating_lists, :restaurant_id
    change_column_null :eating_lists, :restaurant_id, false
  end
end
