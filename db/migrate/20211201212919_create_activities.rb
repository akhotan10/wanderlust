class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.integer :trip_id
      t.string :description

      t.timestamps
    end
  end
end
