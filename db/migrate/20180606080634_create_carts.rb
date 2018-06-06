class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.date :buy_date
      t.integer :quantity
      t.float :price

      t.timestamps null: false
    end
  end
end
