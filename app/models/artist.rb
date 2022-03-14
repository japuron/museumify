class Artist < ApplicationRecord
  # Direct associations

  has_many   :artpieces,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
