class MuseumResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :location, :string
  attribute :description, :string

  # Direct associations

  has_many   :artpieces

  # Indirect associations

end
