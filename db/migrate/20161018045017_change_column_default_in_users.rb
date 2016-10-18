class ChangeColumnDefaultInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :stylist_id, 0
  end
end
