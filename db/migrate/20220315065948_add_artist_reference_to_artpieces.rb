class AddArtistReferenceToArtpieces < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :artpieces, :artists
    add_index :artpieces, :artist_id
    change_column_null :artpieces, :artist_id, false
  end
end
