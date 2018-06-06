class RemovePriceFromCart < ActiveRecord::Migration
  def change
    remove_column :carts, :price, :float
  end
end
