class Admins::ProductsController < ApplicationController
  def index
  	@products = Product.page(params[:page])
  end

  def new
  end

  def edit
  end

  def show
  	@product = Product.find(params[:id])
  end
end
