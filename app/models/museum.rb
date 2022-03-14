class Museum < ApplicationRecord
  # Direct associations

  has_many   :artpieces,
             dependent: :destroy

  # Indirect associations

  has_many   :exhibited_artists,
             through: :artpieces,
             source: :artist

  # Validations

  # Scopes

  def to_s
    name
  end
end
