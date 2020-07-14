class Admins::OrdersController < ApplicationController
  def top
  end

  def index
  	@orders = Order.all
  end

  def show
  	@orders = Order.find(params[:id])
    @order = Order.all
  end

  def update
  	@order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id:[@order.id])
    @order.update(order_status_params)
    if @order.status_before_type_cast == 1
      @order_details.each do |order_detail|
      order_detail.update!(status: 1)
      end
      redirect_to admins_order_path(@order)
    else

      redirect_to request.referer
    end
  end
end

  private
    def order_status_params
    params.require(:order).permit(:id, :status)
    end