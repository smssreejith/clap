class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :customer, foreign_key: true
      t.references :pack, foreign_key: true
      t.integer :no_of_pack
      t.decimal :amount

      t.timestamps
    end
  end
end
