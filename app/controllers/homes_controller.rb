class HomesController < ApplicationController
	def top
		@products = Product.where(status: :true).order(created_at: :desc).page(params[:page]).per(4)
		@genres = Genre.where(status:"有効")
      	@quantity = Product.count
	    if params[:genre_id].present?
	      @products = Products.where(genre_id: params[:genre_id],is_selling: true)
	      @index_products = @products.order(:updated_at).page(params[:page]).per(4)
	      @genre = Genre.find(params[:genre_id])
	      @genres = Genre.where(status:"有効")
	    elsif params[:name].present?
	      @products = Products.where("name LIKE ?", "#{params[:name]}%")
	      @index_products = @products.order(:updated_at).page(params[:page]).per(4)
	      @genres = Genre.where(status:"有効")
	    else
	      @products = Product.all.order(:updated_at).page(params[:page]).per(4)
	      @genres = Genre.where(status:"有効")
	    end		
	end
	def about
	end
end
