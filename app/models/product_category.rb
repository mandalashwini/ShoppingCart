class ProductCategory < ActiveRecord::Base
	 mount_uploaders :images, ImageUploader
    belongs_to :product
    validates :name, presence: true, uniqueness: true
    validates :price, presence: true, numericality: {message: "allowed only numbers" }
    validates :quantity, presence: true, numericality: { message: "allowed only integer numbers", only_integer: true }
    validates :description, presence: true
    scope :find_category_by_product,-> (product_id) { where("product_id = ? ",product_id)}
    scope :find_category,-> (search_data) { where("name = ? ",search_data).uniq}
end
