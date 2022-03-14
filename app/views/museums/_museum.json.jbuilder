json.extract! museum, :id, :name, :location, :description, :created_at,
              :updated_at
json.url museum_url(museum, format: :json)
