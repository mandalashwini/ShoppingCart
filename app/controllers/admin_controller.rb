class AdminController < ApplicationController
  layout 'admin/adminDashboard'
  def index
  end

  def new
    product=Product.new
    puts "hello"
  end
  def addProduct
    product=Product.new
    puts "Welcome"
    
  end
end
