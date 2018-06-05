class ProductCategory < ActiveRecord::Base
	 mount_uploaders :images, ImageUploader
    belongs_to :product
    has_many :carts, dependent: :destroy
    has_and_belongs_to_many :orders
    validates :name, presence: true, uniqueness: { case_sensitive: false } 
    validates :price, presence: true, numericality: {message: "allowed only numbers" }
    validates :quantity, presence: true, numericality: { message: "allowed only integer numbers", only_integer: true }
    validates :description, presence: true
    scope :find_category_by_product,-> (product_id) { where("product_id = ? ",product_id)}
    scope :find_category,-> (search_data) { where("lower(name) LIKE ?","%#{search_data}%") }

end
