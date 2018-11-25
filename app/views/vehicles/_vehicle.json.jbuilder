json.extract! vehicle, :id, :vin, :year, :make, :model, :color, :wholesale_price, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
