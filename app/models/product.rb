class Product < ActiveRecord::Base
    has_many :product_categories, dependent: :destroy
    validates :product_name, presence: true , uniqueness: true    
    

    scope :product_search,-> { joins(:product_categories).where("quantity > ? ",0).uniq}
    
end
