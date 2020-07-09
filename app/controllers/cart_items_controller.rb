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
    	@cart = CartItem.new
    	@cart.user_id = current_user.id
    	@cart.save
    	redirect_to ""
    end

    def update
    	@cart =CartItem.find(params[:id])
    	@cart.update(cart_item_params)
    	@user = current_user
    	redirect_to ""
    end

    def destroy
    	@cart = CartItem.find(params[:id])
    	 if @cart.destroy
    	    redirect_to ""
    	 else
    	 	render cart_items_path
    	 end
    end

    def destroy_all
    	@user = User.find(cuurent_user.id)
    	if @user.cart_items.destroy_all
    		flash[:notice] = "カートの商品を全て削除しました"
    	else
    		render 'cart_items_path'
    	end

    end

    private

    def cart_item_params
    	params.require(:cart_item).permit(:user_id, :product_id, :price, :count)
    end


end
