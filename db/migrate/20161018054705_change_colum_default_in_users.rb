class ChangeColumDefaultInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :stylist_id, 1
  end
end
