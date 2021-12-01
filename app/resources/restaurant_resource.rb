class RestaurantResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :country_id, :integer
  attribute :name, :string
  attribute :rating, :integer

  # Direct associations

  # Indirect associations

end
