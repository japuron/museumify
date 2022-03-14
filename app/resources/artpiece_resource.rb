class ArtpieceResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string
  attribute :year, :integer
  attribute :artistic_movement, :string
  attribute :description, :string
  attribute :image, :string
  attribute :artist_id, :integer
  attribute :museum_id, :integer

  # Direct associations

  belongs_to :museum

  has_many   :likes

  belongs_to :artist

  # Indirect associations

end
