class CityResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :country_id, :integer

  # Direct associations

  belongs_to :country

  # Indirect associations

end
