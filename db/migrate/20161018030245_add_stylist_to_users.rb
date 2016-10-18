class AddStylistToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :stylist, foreign_key: true
  end
end
