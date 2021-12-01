class TripResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string
  attribute :start_date, :date
  attribute :end_date, :date
  attribute :user_id, :integer
  attribute :cover_photo, :string
  attribute :photo_album_link, :string

  # Direct associations

  # Indirect associations

end