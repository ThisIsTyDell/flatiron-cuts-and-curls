class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :date
      t.string :hour
      t.integer :user_id

      t.timestamps
    end
  end
end
