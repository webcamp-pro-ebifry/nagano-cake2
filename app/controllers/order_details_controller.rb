class OrderDetailsController < ApplicationController
 

  # GET /order_details
  # GET /order_details.json
  def index
    @orders = Order.where(user_id: current_user).page(params[:page])
  end

  # GET /order_details/1
  # GET /order_details/1.json
  def show
    @order = Order.find(params[:id])
  end

  def update

  end
  # DELETE /order_details/1

  private
    def order_status_params
    params.require(:order).permit(:id, :order_status)

    end
    # Only allow a list of trusted parameters through.
    def order_detail_params
      params.require(:order_detail).permit(:product_id, :order_id, :count, :price, :status)
    end
end
