class AddMuseumReferenceToArtpieces < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :artpieces, :museums
    add_index :artpieces, :museum_id
    change_column_null :artpieces, :museum_id, false
  end
end
