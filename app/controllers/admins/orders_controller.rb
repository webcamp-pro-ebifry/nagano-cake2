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
    @order.update(order_status_params)
    redirect_to admins_orders_path
    if @order.status == "入金確認"
      @order.order_details.each do |order_detail|
      order_detail.update(status: "製作待ち")
      redirect_to admins_orders_path
      end
    end
  end
end

  private
    def order_status_params
    params.require(:order).permit(:id, :status)
    end