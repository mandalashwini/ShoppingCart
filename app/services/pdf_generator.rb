class PdfGenerator < Prawn::Document
	
	def initialize(cart)
		super(top_margin: 70)
		@cart = cart
		puts @cart
		bill_title
		bounding_box([10,650], :width => 400) do 
		product_details
	   end
	end
	def bill_title
		bounding_box([100,700], :width => 400) do
		text "Bill Receipt", size: 20 , style: :bold
		end
	end

	def product_details
		total=0
		@cart.each do |cartObj|
			@product_category=ProductCategory.find(cartObj.product_category_id)
			move_down 10
			text "#{@product_category.name }",size: 12 ,style: :bold
			text "Price :- #{@product_category.price }"
			text "GST :- #{@product_category.GST}"
			text "Quantity :- #{cartObj.quantity }"
			text "Net price :- #{cartObj.net_price }"
			text "Buy Date :- #{cartObj.buy_date }"
			total = total + cartObj.net_price
			stroke do
			  move_down 10
			  horizontal_rule
			end
		end
		move_down 10
		text "Total :- #{total}"
		#[["Price",@cart.price]]+ [["description",@cart.description]] + [["Buy Date", Date.today]]
	end


end