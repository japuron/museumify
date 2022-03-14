class Like < ApplicationRecord
  # Direct associations

  belongs_to :liker,
             :class_name => "User"

  belongs_to :artpiece

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    artpiece.to_s
  end

end
