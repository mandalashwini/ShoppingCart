class AddPriceToProductCategories < ActiveRecord::Migration
  def change
    add_column :product_categories, :price, :float
  end
end
