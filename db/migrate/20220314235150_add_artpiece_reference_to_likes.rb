class AddArtpieceReferenceToLikes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :likes, :artpieces
    add_index :likes, :artpiece_id
    change_column_null :likes, :artpiece_id, false
  end
end
