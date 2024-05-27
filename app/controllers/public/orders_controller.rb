class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    @order.total_payment = calculate_total_payment

    # 住所選択による処理
    case params[:order][:shipping_address]
    when '1'
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    when '2'
      selected_address = Address.find(params[:order][:address_id])
      @order.postal_code = selected_address.postal_code
      @order.address = selected_address.address
      @order.name = selected_address.name
    when '3'
      # すでにフォームから送信されたデータが@orderにセットされているので何もしない
    end
    render :confirm
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800  # shipping_costを設定
    @order.total_payment = calculate_total_payment

    if @order.save
      # カート内アイテムの処理
      current_customer.cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item_id
        @order_detail.price = cart_item.item.with_tax_price
        @order_detail.amount = cart_item.amount
        @order_detail.making_status = 0
        @order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to thanks_orders_path
    else
      render :new
    end
  end

  def index
    @orders = current_customer.orders.includes(order_details: :item)
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name)
  end

  def calculate_total_payment
    current_customer.cart_items.sum(&:subtotal) + 800 # 固定の送料を追加
  end
end
