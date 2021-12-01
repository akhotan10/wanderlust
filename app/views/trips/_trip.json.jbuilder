json.extract! trip, :id, :title, :start_date, :end_date, :user_id, :cover_photo, :photo_album_link, :created_at, :updated_at
json.url trip_url(trip, format: :json)
