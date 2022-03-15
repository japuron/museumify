class Artist < ApplicationRecord
  mount_base64_uploader :artistpic, ArtistpicUploader

  # Direct associations

  has_many   :artpieces,
             dependent: :destroy

  # Indirect associations

  has_many   :exhibitions,
             through: :artpieces,
             source: :museum

  # Validations

  # Scopes

  def to_s
    name
  end
end
