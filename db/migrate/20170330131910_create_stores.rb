class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :store_name
      t.text :store_address
      t.integer :store_postcode
      t.string :store_state
      t.string :store_phone

      t.timestamps
    end
  end
end
