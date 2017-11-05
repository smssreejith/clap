json.extract! schedule, :id, :customer_id, :booking_id, :pack_id, :employee_id, :appointment, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
