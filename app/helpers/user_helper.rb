module UserHelper
	def cart_count
		Cart.select(:id).all.count
	end
end
