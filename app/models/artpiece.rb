class Artpiece < ApplicationRecord
  # Direct associations

  belongs_to :museum

  has_many   :likes,
             :dependent => :destroy

  belongs_to :artist

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    title
  end

end
