class RemoveDayFromAppointments < ActiveRecord::Migration[5.0]
  def change
    remove_column :appointments, :day, :string
  end
end
