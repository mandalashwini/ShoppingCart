class OrdersProductCategory < ActiveRecord::Base
  belongs_to :product_category
  belongs_to :order
end
