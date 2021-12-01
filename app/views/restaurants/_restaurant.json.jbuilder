json.extract! restaurant, :id, :country_id, :name, :rating, :created_at,
              :updated_at
json.url restaurant_url(restaurant, format: :json)
