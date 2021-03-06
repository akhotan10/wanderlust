class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.integer :user_id
      t.string :cover_photo
      t.string :photo_album_link

      t.timestamps
    end
  end
end
