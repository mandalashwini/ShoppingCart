class AddImageToProductCategory < ActiveRecord::Migration
  def change
    add_column :product_categories, :images, :json
  end
end
