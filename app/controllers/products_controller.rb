class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new

  end

  def index
    @genres = Genre.where(status: "有効")
    if params[:genre_id].present?
      @products = Products.where(genre_id: params[:genre_id],is_selling: true)
      @index_products = @products.order(:updated_at).page(params[:page]).per(8)
      #@genre = Genre.find(params[:genre_id])
      @genre = Genre.where(id: params[:genre_id], status: 0)
    elsif params[:name].present?
      @products = Products.where("name LIKE ?", "#{params[:name]}%")
      @index_products = @products.order(:updated_at).page(params[:page]).per(8)
      @genres = Genre.where(status: "有効")
    else
      #@products = Product.all.order(:updated_at).page(params[:page]).per(8)
      @p = Product.joins(:genre).where(genres: {status: "有効"}).order(:updated_at)
      @products = @p.page(params[:page]).per(8)
      @genres = Genre.where(status: "有効")
      @quantity = @p.count
    end
  end

    def create
      @cart_item = CartItem.new
      @cart_item.save
  end
end