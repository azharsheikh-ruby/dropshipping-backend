class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :customer_id
      t.string :status

      t.timestamps
    end
  end
end
