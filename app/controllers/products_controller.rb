class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  def index
    if params[:genre_id].present?
      @products = Products.where(genre_id: params[:genre_id],is_selling: true)
      @index_products = @products.order(:updated_at).page(params[:page])
      @genre = Genre.find(params[:genre_id])
    elsif params[:name].present?
      @products = Products.where("name LIKE ?", "#{params[:name]}%")
      @index_products = @products.order(:updated_at).page(params[:page])
    else
      @products = Product.all.order(:updated_at).page(params[:page])
    end
  end
end