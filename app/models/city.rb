class City < ApplicationRecord
  # Direct associations

  belongs_to :country

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
