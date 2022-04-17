class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|

      t.integer :order_id, null: false
      t.integer :product_id, null: false
      t.integer :product_count, null: false
      t.integer :product_status, null: false, default: 0
      t.integer :purchase_price, null: false
      t.timestamps
    end
  end
end
