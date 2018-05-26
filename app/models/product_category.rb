class ProductCategory < ActiveRecord::Base
    belongs_to :product
    validates :name, presence: true, uniqueness: true
    validates :price, presence: true, numericality: {message: "allowed only numbers" }
    validates :quantity, presence: true, numericality: { message: "allowed only integer numbers", only_integer: true }
    validates :description, presence: true
end
