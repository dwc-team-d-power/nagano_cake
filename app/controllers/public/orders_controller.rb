class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end
  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    case params[:order][:address_option]
    when 'current'
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name
    when 'select'
      selected_address = Address.find(params[:order][:address_id])
      @order.postal_code = selected_address.postal_code
      @order.address = selected_address.address
      @order.name = selected_address.name
    when 'new'
      # すでにフォームから送信されたデータが@orderにセットされているので何もしない
    end
    render :confirm
  end
    def create
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @order.total_payment = current_customer.cart_items.sum(&:subtotal) + @order.shipping_cost
    @order.customer_id = current_customer.id
    if @order.save
      redirect_to thanks_orders_path
    else
      render :new
    end
    end
   def show
    @order = Order.find(params[:id])
   end
   def index
     @orders = Order.all
   end    
  private

  def order_params
    params.require(:order).permit(:payment_method, :address_option,:postal_code, :address, :name)
  end
  
  # def calculate_total_payment(order)
  #   cart_items = current_customer.cart_items
  #   items_total = cart_items.sum{|item|item.amount*item.item.with_tax_price}
  #   total_payment = items_total + order.shipping_cost
  #   total_payment
  # end   
end
