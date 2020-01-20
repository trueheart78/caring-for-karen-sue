class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.string :selection, null: false, default: 'donation'
      t.string :payment_type, null: false
      t.integer :amount_in_cents, null: false, default: 0

      t.timestamps
    end
  end
end
