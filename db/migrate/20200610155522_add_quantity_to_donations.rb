class AddQuantityToDonations < ActiveRecord::Migration[5.2]
  def change
    add_column :donations, :quantity, :integer, default: 1
  end
end
