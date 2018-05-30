class CreateJoinTableProductCategoryAndOrder < ActiveRecord::Migration
  def change
    create_join_table :product_categories, :orders do |t|
      # t.index [:product_category_id, :order_id]
      # t.index [:order_id, :product_category_id]
    end
  end
end
