class CartItemsController < ApplicationController
	def index
		@cart_item = CartItem.new
		@cart_items = CartItem.where(user_id: current_user)
		@total_price = 0
		@cart_items.each do |cart_item|
			@total_price += (cart_item.product.price * cart_item.count)
		end
    end

    def create
    	@cart = CartItem.new(cart_item_params)
    	@cart.save
    	redirect_to cart_items_path
    end

    def update
    	@cart =CartItem.find(params[:id])
    	@cart.update(cart_item_params)
    	@user = current_user
    	redirect_to ""
    end

    def destroy
    	@cart = CartItem.find(params[:id])
    	@cart.destroy
    	redirect_to ""
    end

    def destroy_all
    	@user = current_user
    	if @user.cart_items.destroy_all
    		flash[:notice] = "カートの商品を全て削除しました"
    	else
    		render""
    	end

    end

    private

    def cart_item_params
    	  params.permit(:user_id, :product_id, :price, :count)

    end


end
