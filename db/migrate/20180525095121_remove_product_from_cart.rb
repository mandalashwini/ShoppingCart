class RemoveProductFromCart < ActiveRecord::Migration
  def change
    remove_reference :carts, :product, index: true
    
  end
end
