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

  has_many   :highlights

  has_many   :activities

  has_many   :eating_lists

  has_many   :itineraries

  belongs_to :user

  # Indirect associations
end
