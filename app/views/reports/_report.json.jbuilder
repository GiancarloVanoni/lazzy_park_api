json.extract! report, :id, :latitude, :longitude, :report_type, :description, :created_at, :updated_at
json.url report_url(report, format: :json)
