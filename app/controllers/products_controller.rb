class ProductsController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  layout 'admin/adminDashboard'
  def index
    @products=Product.all
  end

  def new
    @product=Product.new
  end

  def create
    #render plain: params.inspect
          @product=Product.new(product_params)
          if  @product.save
          flash[:notice] = "record created!!!!"
          redirect_to admindashboard_path
          else
            render :new
          end
    
  end

  def edit
    @product=Product.find(params[:id])
  end

  def update
    @product=Product.find(params[:id])
    if(@product.update(product_params))
      flash[:notice] = "record updated!!!!"
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
