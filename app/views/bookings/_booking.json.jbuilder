json.extract! booking, :id, :customer_id, :pack_id, :no_of_pack, :amount, :created_at, :updated_at
json.url booking_url(booking, format: :json)
