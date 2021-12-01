class ActivityResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :trip_id, :integer
  attribute :description, :string

  # Direct associations

  belongs_to :trip

  # Indirect associations

end
