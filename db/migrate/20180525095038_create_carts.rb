class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.date :buy_date
      t.references :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :carts, :products
  end
end
