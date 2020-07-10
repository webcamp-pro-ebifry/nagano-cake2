class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new

  end

  def index
      @quantity = Product.count
    if params[:genre_id].present?
      @products = Products.where(genre_id: params[:genre_id],is_selling: true)
      @index_products = @products.order(:updated_at).page(params[:page])
      @genre = Genre.find(params[:genre_id])
      @genres = Genre.all
    elsif params[:name].present?
      @products = Products.where("name LIKE ?", "#{params[:name]}%")
      @index_products = @products.order(:updated_at).page(params[:page])
      @genres = Genre.all
    else
      @products = Product.all.order(:updated_at).page(params[:page])
      @genres = Genre.all
    end
  end

    def create
      @cart_item = CartItem.new
      @cart_item.save
  end
end