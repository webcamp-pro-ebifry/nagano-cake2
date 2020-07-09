class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
 
  # GET /orders/new
  def new
    @order = Order.new
    @user = current_user
    @shipping_address = @user.shipping_addresses.all
  end

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.new(order_params)
    @user = current_user
    @cart_item = @user.cart_items.all
  if params[:address] == "1"
      @orders.name = current_user.lastname + current_user.firstname
      @orders.postcode = current_user.postal_code
      @orders.address = current_user.address
    elsif params[:address] == "2"
      @orders.name = ShippingAddress.find(params[:order][:select_address].to_i).name
      @orders.postcode = ShippingAddress.find(params[:order][:select_address].to_i).postcode
      @orders.address = ShippingAddress.find(params[:order][:select_address].to_i).address
    elsif params[:address] == "3"
      # 住所の登録を行う。注文確定の時に入れたほうがいい。
      @shipping = ShippingAddress.new(address_params)
      @shipping.user_id = current_user.id
      @shipping.save
      # 登録された住所を、オーダーモデルのカラムに格納する
      @orders.name = @shipping.name
      @orders.postcode = @shipping.postcode
      @orders.address = @shipping.address
    end

  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end



  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
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
    def set_order
      @order = Order.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:user_id, :payment_method, :postage, :payment, :status, :address, :postcode, :name)
    end
    def address_params
      params.require(:shipping_address).permit(:name, :postcode, :address )
    end
end
