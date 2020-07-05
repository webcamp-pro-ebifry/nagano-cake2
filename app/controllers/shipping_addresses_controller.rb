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
			render "edit"
		end
	end

	def edit
    end

    def update
    end

    def delete
    end

    protected
    def shipping_params
    	params.require(:shipping_address).permit(:postcode, :address, :name)
    end
end
