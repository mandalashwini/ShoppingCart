class PdfGenerator < Prawn::Document
	
	def initialize(product_category)
		super(top_margin: 70)
		@product_category = product_category
		puts @product_category
		bill_title
		bounding_box([200,650], :width => 400) do
		product_name
		product_details
	   end
	end
	def bill_title
		bounding_box([200,700], :width => 400) do
		text "Bill Receipt", size: 20 , style: :bold
		end
	end

	def product_name
		text "#{@product_category.name}", size: 20 ,style: :bold
	end

	def product_details
		move_down 10
		table product_details_row do 
			row(0).font_style = :bold
			column(1..2).align= :right
			cells.style.border_width = 0
			position = :center
		end
	end

	def product_details_row

		[["Price","description","Buy Date"]] + [[@product_category.price,@product_category.description, @product_category.buy]]

		
	end


end