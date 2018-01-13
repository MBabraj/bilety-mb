json.extract! event, :id, :artist, :description, :event_date, :created_at, :updated_at, :price_low, :price_high
json.url event_url(event, format: :json)
