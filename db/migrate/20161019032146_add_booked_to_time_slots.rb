class AddBookedToTimeSlots < ActiveRecord::Migration[5.0]
  def change
    add_column :time_slots, :booked, :boolean, :default => false
  end
end
