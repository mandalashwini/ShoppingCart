class ProductCategory < ActiveRecord::Base
    belongs_to :product
    validates :name, presence: true
    validates :price, presence: true
    validates :quantity, presence: true,format: { with: /\A[0-9]+\Z/, message: "only allows numbers " }
    validates :description, presence: true
end
