class CreateAppointmentServices < ActiveRecord::Migration[5.0]
  def change
    create_table :appointment_services do |t|
      t.references :appointment, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
