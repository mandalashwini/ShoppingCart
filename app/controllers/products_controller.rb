class ProductsController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  layout 'admin/adminDashboard'
  def index
    @products=Product.all
  end

  def new
    #render plain: params.inspect
    @product=Product.new
    respond_to do |format|
     format.html{render :partial => 'products/new' ,locals: {product: @product} }
    end
    
  end

  def create
   # render plain: params.inspect
          @product=Product.new(product_params)
          if  @product.save
          redirect_to admindashboard_path
          else
            redirect_to :back
          end
    
  end

  def edit
    # render plain: params.inspect
    @product=Product.find(params[:pid].to_i)
     respond_to do |format|
     format.html{render :partial => 'products/edit' ,locals: {product: @product} }
    end
  end

  def update
     #render plain: params.inspect
    @product=Product.find(params[:id])
    if(@product.update(product_params))
      redirect_to admindashboard_path
    else
      render :edit
    end

  end


  def show
    @product=Product.find(params[:id])
  end

  def destroy
    @product=Product.find(params[:id])
    @product.destroy
    redirect_to admindashboard_path
  end
  private
  def product_params
      params.require(:product).permit(:product_name)
  end
end
