json.extract! report, :id, :report_type, :description, :created_at, :updated_at
json.url report_url(report, format: :json)
