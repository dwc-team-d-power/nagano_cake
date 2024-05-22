class Admin::OrdersController < ApplicationController
 # before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @ordered_items = @order.ordered_items
    @ordered_item = OrderedItem.find(@order.id)
  end


  def update
    @order = Order.find(params[:id])
   if @order.update(order_params)
      redirect_to admin_orders_path, notice: 'ユーザ情報を更新しました。'
   else
      render :show
    @customer = @order.user
    @ordered_items = @order.ordered_items
    @ordered_item = OrderedItem.find(@order.id)
   end

  end

private

  def order_params
    params.require(:order).permit(:customer_id, :total_charge, :purchase_date, :payment_method, :order_status, :postage, :destination_address, :destination_name, :destination_postal_code)
  end

end