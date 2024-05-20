class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end
  
  private

  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :payment_method)
  end
end
