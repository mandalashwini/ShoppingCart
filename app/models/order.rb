class Order < ActiveRecord::Base
	has_and_belongs_to_many :product_categories
	belongs_to :user
end
