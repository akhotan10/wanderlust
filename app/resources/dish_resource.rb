class DishResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :restaurant_id, :integer

  # Direct associations

  belongs_to :restaurant

  # Indirect associations
end
