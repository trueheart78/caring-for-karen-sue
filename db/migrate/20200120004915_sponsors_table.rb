class SponsorsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :sponsors do |t|
      t.string :name, null: false
      t.string :tagline, null: false
      t.string :url, null: false
      t.string :image, null: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
