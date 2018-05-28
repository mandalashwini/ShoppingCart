class SearchOperations
	def self.searchProduct
		puts "aaaa"
	    @product_search=Product.product_search
    end

    def self.searchCategories(search_data)
    	@product_id=Product.where(product_name: search_data).pluck(:id).first
    	    	puts @product_id
    	if @product_id.present?
    		@categories=ProductCategory.find_category_by_product(@product_id)
    	elsif @product_id.nil?
    		@categories=ProductCategory.find_category(search_data)
    	else
    		@categories=nil
    	end
    end
end	