class AddPriceToCart < ActiveRecord::Migration
  def change
    add_column :carts, :net_price, :float
  end
end
