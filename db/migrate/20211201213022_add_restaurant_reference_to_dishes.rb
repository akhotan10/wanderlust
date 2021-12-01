class AddRestaurantReferenceToDishes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :dishes, :restaurants
    add_index :dishes, :restaurant_id
    change_column_null :dishes, :restaurant_id, false
  end
end
