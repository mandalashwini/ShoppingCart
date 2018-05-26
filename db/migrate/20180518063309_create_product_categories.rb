class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :type
      t.string :decription
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
