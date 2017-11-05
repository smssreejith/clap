class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :contact_number
      t.string :ref
      t.string :booking_status
      t.datetime :last_contacted
      t.decimal :amount_pending

      t.timestamps
    end
  end
end
