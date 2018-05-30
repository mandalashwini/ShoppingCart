class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :product_category
  validates :buy_date, :user_id, :product_category_id, presence: true


end

