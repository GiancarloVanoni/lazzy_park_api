json.extract! pin, :id, :latitude, :longitude, :status, :insecure_percent, :created_at, :updated_at
json.url pin_url(pin, format: :json)
