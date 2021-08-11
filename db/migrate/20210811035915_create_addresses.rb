class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :zip,               null: false
      t.integer :shipping_from_id, null: false
      t.string :address_line1,     null: false
      t.string :address_line2,     null: false
      t.string :telephone,         null: false
      t.string :building
      t.references :purchase,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
