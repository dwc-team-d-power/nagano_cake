class Admin::OrdersController < ApplicationController
 # before_action :authenticate_admin!

  def index
    @order = Order.page(params[:page])
    @orders = Order.page(params[:page])
  # customer = @order.customer_id.find(params[:id])
  end

  def show
  @order = Order.find(params[:id])
  @customer = @order.customer
  @ordered_items = @order.order_items
  @odered_item = @order.order_item
  end


  def update
    @order = Order.find(params[:id])
   if @order.update(order_params)
      redirect_to admin_orders_path, notice: 'ユーザ情報を更新しました。'
   else
      render :show
    @customer = @order.customer
    @ordered_items = @order.ordered_items
    @ordered_item = OrderedItem.find(@order.id)
   end

  end

private

  def order_params
    params.require(:order).permit(:customer_id, :total_payment, :created_at, :payment_method, :status, :shipping_cost )
  end

end
