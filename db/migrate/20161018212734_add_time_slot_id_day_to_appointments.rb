class AddTimeSlotIdDayToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :time_slot_id, :integer
    add_index :appointments, :time_slot_id
    add_column :appointments, :day, :string
  end
end
