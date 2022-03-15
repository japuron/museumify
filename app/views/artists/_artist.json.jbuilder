json.extract! artist, :id, :name, :dob_year, :biography, :artistpic,
              :created_at, :updated_at
json.url artist_url(artist, format: :json)
