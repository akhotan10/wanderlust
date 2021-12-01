class Activity < ApplicationRecord
  # Direct associations

  belongs_to :trip

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    trip.to_s
  end

end
