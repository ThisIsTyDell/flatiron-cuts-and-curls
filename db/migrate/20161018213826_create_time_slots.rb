class CreateTimeSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :time_slots do |t|
      t.string :name
      t.string :time
      t.integer :duration
    end
  end
end
