class RemoveTypeFromProductCategory < ActiveRecord::Migration
  def change
    remove_column :product_categories, :type, :string
  end
end
