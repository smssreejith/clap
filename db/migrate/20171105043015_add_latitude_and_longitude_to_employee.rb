class AddLatitudeAndLongitudeToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :address, :string
    add_column :employees, :latitude, :float
    add_column :employees, :longitude, :float
  end
end
