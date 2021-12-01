class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.integer :country_id
      t.string :name
      t.integer :rating

      t.timestamps
    end
  end
end
