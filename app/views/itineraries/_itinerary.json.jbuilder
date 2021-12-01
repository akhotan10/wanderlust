json.extract! itinerary, :id, :country_id, :trip_id, :created_at, :updated_at
json.url itinerary_url(itinerary, format: :json)
