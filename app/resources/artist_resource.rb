class ArtistResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :dob_year, :integer
  attribute :biography, :string
  attribute :artistpic, :string

  # Direct associations

  has_many :artpieces

  # Indirect associations

  many_to_many :exhibitions,
               resource: MuseumResource
end
