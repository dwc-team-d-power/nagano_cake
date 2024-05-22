class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @cart_items = current_customer.id
    @orderes = @cart_items
    @orderes = Orders.new
  end

  def confirm
    @orderes = Orders.new(orders_params)
    if @orderes.customer_id = current_customer.id
       @orderes.save
       flash[:notice] ="注文に成功しました"
        redirect_to thanks_path
    end     
  end

  def thanks
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items.all
    
    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.with_tax_price
      @order_details.amount = cart_item.amount
      @order_details.save
    end
    
    current_customer.cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def index
    @orders = current_customer.id
    @orders = Orderes.all 
  end

  def show
    @order = Orders.find([params:id])
  end
  
  private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment_method)
  end
  
  def address_params
    params.require(:address).permit(:name, :address, :postal_code)
  end
end
