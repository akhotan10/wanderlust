class Country < ApplicationRecord
  # Direct associations

  has_many   :cities,
             :dependent => :destroy

  has_many   :itineraries,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
