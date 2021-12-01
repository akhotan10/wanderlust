class ItineraryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :country_id, :integer
  attribute :trip_id, :integer

  # Direct associations

  belongs_to :country

  belongs_to :trip

  # Indirect associations

end
