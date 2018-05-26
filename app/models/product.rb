class Product < ActiveRecord::Base
    has_many :product_categories, dependent: :destroy
    validates :product_name, presence: true , uniqueness: true    
    

end
