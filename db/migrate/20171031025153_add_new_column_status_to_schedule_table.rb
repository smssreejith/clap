class AddNewColumnStatusToScheduleTable < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :status, :boolean, default: false
  end
end
