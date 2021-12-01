class Dish < ApplicationRecord
  # Direct associations

  belongs_to :restaurant

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
