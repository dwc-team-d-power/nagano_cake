class Admin::OrdersController < ApplicationController
  # before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_orders_path, notice: 'ユーザ情報を更新しました。'
    else
      @customer = @order.customer
      @order_details = @order.order_details
      render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :total_payment, :created_at, :payment_method, :status, :shipping_cost)
  end
end
