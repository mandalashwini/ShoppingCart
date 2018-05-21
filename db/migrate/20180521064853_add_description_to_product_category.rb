class AddDescriptionToProductCategory < ActiveRecord::Migration
  def change
    add_column :product_categories, :description, :string
  end
end
