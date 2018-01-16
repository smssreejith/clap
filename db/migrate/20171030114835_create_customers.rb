class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :contact_number
      t.string :alternate_number
      t.string :profession
      t.string :experience
      t.string :enterprise
      t.integer :age
      t.string :sex
      t.string :refferal_type
      t.string :refferal
      t.string :executive
      t.string :email
      t.string :vehicle_kind
      t.string :vehicle_no
      t.string :vehicle_brand
      t.string :vehicle_model
      t.string :vehicle_color
      t.string :vehicle_gear_type
      t.string :vehicle_no_of_gears
      t.string :vehicle_other
      t.string :cab_name
      t.string :cab_agent
      t.string :cab_rate
      t.string :cab_total_distance
      t.string :cab_total_fare
      t.string :cab_kind
      t.string :cab_no
      t.string :cab_brand
      t.string :cab_model
      t.string :cab_color
      t.string :cab_gear_type
      t.string :cab_no_of_gears
      t.string :home_address
      t.string :office_address
      t.string :location
      t.string :current_provider
      t.string :requirement
      t.string :remarks
      t.string :review
      t.string :rating
      t.string :suggestions
      t.string :insights
      t.string :to_do
      t.string :last_communication
      t.string :call_back
      t.string :status
      t.string :discounts
      t.decimal :amount_pending
      t.timestamps
    end
  end
end
