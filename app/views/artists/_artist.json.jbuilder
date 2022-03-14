json.extract! artist, :id, :name, :dob_year, :biography, :created_at, :updated_at
json.url artist_url(artist, format: :json)
