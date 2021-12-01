class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :dishes,
             dependent: :destroy

  has_many   :eating_lists,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    country_id
  end
end
