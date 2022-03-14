class Artpiece < ApplicationRecord
  # Direct associations

  belongs_to :artist

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    title
  end

end
