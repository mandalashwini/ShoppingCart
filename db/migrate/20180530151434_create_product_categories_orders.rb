class CreateProductCategoriesOrders < ActiveRecord::Migration
  def change
    create_table :product_categories_orders do |t|
      t.references :product_category, index: true
      t.references :order, index: true

      t.timestamps null: false
    end
    add_foreign_key :product_categories_orders, :product_categories
    add_foreign_key :product_categories_orders, :orders
  end
end
