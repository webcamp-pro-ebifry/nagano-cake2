class Admins::OrderDetailsController < ApplicationController
 
  def update
  	@order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(status: params[:order_detail][:status])
    # order_detailの中のstatusの情報をもとにstatusを更新している。

    if @order_details.exists?(status: 2)
      @order.update(status: 2)
      redirect_to request.referer
    elsif @order_details.count == @order_details.where(status: 3).count
      # 別の方法
      # detail = @order_detail.select(:status).distinct
      # detail == 1 && @order_detail.status == 3
      @order.update(status: 3)
      redirect_to request.referer
    end
  end
end

  private
  def order_detail_params
  params.require(:order_detail).permit(:order_id, :status)
  end