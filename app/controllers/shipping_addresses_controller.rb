class ShippingAddressesController < ApplicationController
	def index
		@user = current_user
		@shipping = ShippingAddress.new
		@shippings = @user.shipping_addresses
	end

	def create
		@shipping = ShippingAddress.new
		@shipping.user_id = current_user.id
		@shipping.save
		if @shipping.update(shipping_params)
			redirect_to shipping_addresses_path
		else
			render "index"
		end
	end

	def edit
		@shipping = ShippingAddress.find(params[:id])
    end

    def update
    	@shipping = ShippingAddress.find(params[:id])
    	if @shipping.update(shipping_params)
    		redirect_to shipping_addresses_path
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
