class CreateArtpieces < ActiveRecord::Migration[6.0]
  def change
    create_table :artpieces do |t|
      t.string :title
      t.integer :year
      t.string :artistic_movement
      t.string :description
      t.string :image
      t.integer :artist_id
      t.integer :museum_id

      t.timestamps
    end
  end
end
