class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :buy_date
      t.float :total_price
      t.float :delivery_charges

      t.timestamps null: false
    end
  end
end
