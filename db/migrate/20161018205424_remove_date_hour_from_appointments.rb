class RemoveDateHourFromAppointments < ActiveRecord::Migration[5.0]
  def change
    remove_column :appointments, :date, :string
    remove_column :appointments, :hour, :string
  end
end
