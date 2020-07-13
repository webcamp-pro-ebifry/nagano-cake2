class ShippingAddressesController < ApplicationController
	before_action = :authenticate_user!
	def index
		@user = current_user
		@shipping = ShippingAddress.new
		@shippings = ShippingAddress.where(user_id: current_user)
	end

	def create
		@shipping = ShippingAddress.new
		@shipping.user_id = current_user.id
		@shipping.save
		if @shipping.update(shipping_params)
			redirect_to shipping_addresses_path
		else
			@user = current_user
			@shippings = ShippingAddress.where(user_id: current_user)
			render 'index'
		end
	end

	def edit
		@shipping = ShippingAddress.find(params[:id])
    end

    def update
    	@shipping = ShippingAddress.find(params[:id])
    	if @shipping.update(shipping_params)
    		redirect_to shipping_addresses_path
    	else
    		@user = current_user
    		@shipping = ShippingAddress.new
    		@shippings = ShippingAddress.where(user_id: current_user)
    		render 'edit'
    	end

    end

    def destroy
    	@shipping = ShippingAddress.find(params[:id])
    	@shipping.destroy
    	redirect_to shipping_addresses_path
    end

    protected
    def shipping_params
    	params.require(:shipping_address).permit(:postcode, :address, :name)
    end
end
