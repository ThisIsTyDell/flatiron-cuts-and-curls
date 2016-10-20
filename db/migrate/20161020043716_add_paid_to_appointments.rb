class AddPaidToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :paid, :boolean, default: false
    add_column :appointments, :total_price_paid, :integer, default: 0
  end
end
