json.extract! customer, :id, :gender, :first_name, :last_name, :address, :email, :phone, :created_at, :updated_at
json.url customer_url(customer, format: :json)
