class AddCountryReferenceToCities < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :cities, :countries
    add_index :cities, :country_id
    change_column_null :cities, :country_id, false
  end
end
