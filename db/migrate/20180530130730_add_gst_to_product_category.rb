class AddGstToProductCategory < ActiveRecord::Migration
  def change
    add_column :product_categories, :GST, :float
  end
end
