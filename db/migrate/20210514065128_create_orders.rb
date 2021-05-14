class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shipping_cost
      t.integer :pay_type, default: 0
      t.integer :total_price
      t.string :address
      t.string :postcode
      t.string :name
      t.integer :buy_status, default: 0

      t.timestamps
    end
  end
end
