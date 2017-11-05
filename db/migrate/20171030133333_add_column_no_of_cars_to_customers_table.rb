class AddColumnNoOfCarsToCustomersTable < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :no_of_cars, :integer
  end
end
