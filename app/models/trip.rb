class Trip < ApplicationRecord
  # Direct associations

  has_many   :itineraries,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    title
  end

end
