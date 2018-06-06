class CreateOrdersProductCategories < ActiveRecord::Migration
  def change
    create_table :orders_product_categories do |t|
      t.references :product_category, index: true
      t.references :order, index: true

      t.timestamps null: false
    end
    add_foreign_key :orders_product_categories, :product_categories
    add_foreign_key :orders_product_categories, :orders
  end
end
