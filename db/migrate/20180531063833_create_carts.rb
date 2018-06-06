class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.date :buy_date
      t.integer :quantity
      t.float :net_price

      t.timestamps null: false
    end
  end
end
