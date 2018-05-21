class AddProductToProductCategory < ActiveRecord::Migration
  def change
    add_reference :product_categories, :product, index: true
    add_foreign_key :product_categories, :products
  end
end
