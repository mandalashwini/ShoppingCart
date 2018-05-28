class AddProductCategoryReferencesToImage < ActiveRecord::Migration
  def change
    add_reference :images, :product_category, index: true
    add_foreign_key :images, :product_categories
  end
end
