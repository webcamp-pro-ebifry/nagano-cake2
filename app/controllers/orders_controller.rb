class OrdersController < ApplicationController
  
  # GET /orders/new
  def new
    @order = Order.new
    @user = current_user
    @shipping_address = @user.shipping_addresses.all
  end

  # GET /orders
  # GET /orders.json
  def index
    @order = Order.new(order_params)
    @user = current_user
    @cart_item = @user.cart_items.all
  if params[:address] == "1"
      @order.name = current_user.lastname + current_user.firstname
      @order.postcode = current_user.postal_code
      @order.address = current_user.address
    elsif params[:address] == "2"
      @order.name = ShippingAddress.find(params[:order][:select_address].to_i).name
      @order.postcode = ShippingAddress.find(params[:order][:select_address].to_i).postcode
      @order.address = ShippingAddress.find(params[:order][:select_address].to_i).address
    elsif params[:address] == "3"
      # 住所の登録を行う。注文確定の時に入れたほうがいい。
      @shipping = ShippingAddress.new(address_params)
      @shipping.user_id = current_user.id
      @shipping.save
      # 登録された住所を、オーダーモデルのカラムに格納する
      @order.name = @shipping.name
      @order.postcode = @shipping.postcode
      @order.address = @shipping.address
    end

  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    if @order.save
       @cart_items = current_user.cart_items
       @cart_items.each do |f|
        order_detail = OrderDetail.new
        order_detail.count = f.count
        order_detail.price = (f.product.price * 1.1) * f.count
        order_detail.order_id = @order.id
        order_detail.product_id = f.product_id
        order_detail.save
      end
      @cart_items.destroy_all
      redirect_to orders_fin_path
    else
      @order = Order.new
      @shipping = ShippingAddress.new
      @address = curre  @order.customer_id = current_customer.idnt_useer.delivers.all
      render :new
    end
  end

  def fin
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:user_id, :payment_method, :postage, :payment, :status, :address, :postcode, :name)
    end
    def address_params
      params.require(:shipping_address).permit(:name, :postcode, :address )
    end
end
