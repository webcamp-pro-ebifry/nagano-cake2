class Admins::ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end


  def create
    @product = Product.new(product_params)
    if @product.save(name: params[:product][:name], status: params[:product][:genre_id].to_i, status: params[:product][:product_status].to_i) 
      flash[:notice] = "successfully"
      redirect_to admins_products_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  def show
  	@product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :introduce, :image_id, :price, :genre_id, :product_status, :delete_flag)
end
