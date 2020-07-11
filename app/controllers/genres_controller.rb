class GenresController < ApplicationController

  def index

  end
  def show
  	@products = @genre.products
  	@products = @products.where(buyer_id: nil).order("created_at DESC").page(params[:page]).per(8)
  end

  private
	def set_category
	  @category = Category.find(params[:id])
	end
end
