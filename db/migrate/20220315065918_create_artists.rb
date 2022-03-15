class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :dob_year
      t.string :biography
      t.string :artistpic

      t.timestamps
    end
  end
end
