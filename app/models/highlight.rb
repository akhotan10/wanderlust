class Highlight < ApplicationRecord
  # Direct associations

  belongs_to :trip

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    description
  end

end
