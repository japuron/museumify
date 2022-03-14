json.extract! artpiece, :id, :title, :year, :artistic_movement, :description, :image, :artist_id, :museum_id, :created_at, :updated_at
json.url artpiece_url(artpiece, format: :json)
