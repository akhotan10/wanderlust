class Trip < ApplicationRecord
  mount_uploader :cover_photo, CoverPhotoUploader

  # Direct associations

  has_many   :highlights,
             dependent: :destroy

  has_many   :activities,
             dependent: :destroy

  has_many   :eating_lists,
             dependent: :destroy

  has_many   :itineraries,
             dependent: :destroy

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    title
  end
end
