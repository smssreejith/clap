class AddNewColumnAmountPaidToBookingTable < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :amount_paid, :decimal
  end
end
