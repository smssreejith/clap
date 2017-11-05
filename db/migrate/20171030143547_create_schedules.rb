class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.references :customer, foreign_key: true
      t.references :booking, foreign_key: true
      t.references :pack, foreign_key: true
      t.references :employee, foreign_key: true
      t.datetime :appointment

      t.timestamps
    end
  end
end
