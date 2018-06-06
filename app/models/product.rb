class Product < ActiveRecord::Base
    has_many :product_categories, dependent: :destroy
    validates :product_name, presence: true , uniqueness: { case_sensitive: false } 
    
    scope :find_product,-> (search_data){ where("lower(product_name) LIKE ?","%#{search_data}%").pluck(:id) }
    scope :product_search,-> { joins(:product_categories).where("quantity > ? ",0).uniq}
    
end
