class AddProductCategoryReferencesToCarts < ActiveRecord::Migration
  def change
    add_reference :carts, :product_category, index: true
    add_foreign_key :carts, :product_categories
  end
end
