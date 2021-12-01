class Itinerary < ApplicationRecord
  # Direct associations

  belongs_to :country

  belongs_to :trip

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    country.to_s
  end
end
