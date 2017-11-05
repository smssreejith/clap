class CreatePacks < ActiveRecord::Migration[5.0]
  def change
    create_table :packs do |t|
      t.string :name
      t.decimal :amount
      t.integer :no_of_appointments

      t.timestamps
    end
  end
end
