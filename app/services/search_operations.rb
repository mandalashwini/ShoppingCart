class SearchOperations
	def self.searchProduct
		puts "aaaa"
	    @product_search=Product.product_search
    end

    def self.searchCategories(search_data)
    	#@product_id=Product.where(product_name: search_data).pluck(:id).first
    	    	
        @product_id=Product.find_product(search_data)
        puts @product_id
    	if @product_id.present?
            puts "ppp"
    		@categories=ProductCategory.find_category_by_product(@product_id)
        
    	elsif @product_id.empty?
            puts "aaa"
           
    		@categories=ProductCategory.find_category(search_data)
    	
    	end
    end
end	