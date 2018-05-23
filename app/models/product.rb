class Product < ActiveRecord::Base
    has_many :product_categories, dependent: :destroy
    validates :product_name, presence: true

    
    def self.already_exist?(product_name)
    	where(product_name: product_name)
    end
end
