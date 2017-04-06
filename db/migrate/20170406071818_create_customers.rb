class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :cust_name
      t.text :cust_address
      t.integer :cust_postcode
      t.string :cust_state
      t.string :cust_phone

      t.timestamps
    end
  end
end
