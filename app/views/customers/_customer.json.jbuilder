json.extract! customer, :id, :name, :contact_number, :ref, :booking_status, :last_contacted, :amount_pending, :created_at, :updated_at
json.url customer_url(customer, format: :json)
