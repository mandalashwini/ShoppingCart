class RemoveDecriptionFromProductCategory < ActiveRecord::Migration
  def change
    remove_column :product_categories, :decription, :string
  end
end
