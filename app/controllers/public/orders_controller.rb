class Public::OrdersController < ApplicationController
   before_action :authenticate_customer!
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end
  def confirm
    @order = Order.new(order_params)
<<<<<<< HEAD
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    @order.total_payment = calculate_total_payment
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
=======
    @order.shipping_cost = 800
    
    if params[:order][:shipping_address] == "1"
      @order.name = "#{current_customer.last_name} #{current_customer.first_name}"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      
    elsif params[:order][:shipping_address] == "2"
       @order.name = Address.find(params[:order][:address_id]).name
       @order.address = Address.find(params[:order][:address_id]).address
       @order.postal_code = Address.find(params[:order][:address_id]).postal_code
       
    elsif params[:order][:shipping_address] == "3"
      address_new = current_customer.addresses.new(address_params)
      address_new.save
      
    else
      render :new
    end
    
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    # inject(0)初期値は0、{|初期値, 要素| ブロック処理 }itemはcart_itemに変更?
    # <% @total +=  cart_item.subtotal %>
    @total_payment = @order.shipping_cost + @total
    
>>>>>>> customer_sakamoto
  end
    def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800 # 例として固定の送料を設定
    @order.total_payment = calculate_total_payment

    if @order.save
      current_customer.cart_items.each do |cart_item|
        @order.order_details.create(
          item_id: cart_item.item.id,
          price: cart_item.item.with_tax_price,
          amount: cart_item.amount,
          making_status: 0 
        )
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

<<<<<<< HEAD
  def order_params
    params.require(:order).permit(:payment_method, :address_option,:postal_code, :address, :name)
  end
  
 def calculate_total_payment
    current_customer.cart_items.sum(&:subtotal) + 800 # 固定の送料を追加
 end
=======
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
  end

  def show
  end
  
  private

  def order_params
    params.require(:order).permit(:name, :address, :postal_code, :payment_method)
  end
  
  def address_params
    params.require(:address).permit(:name, :address, :postal_code)
  end
>>>>>>> customer_sakamoto
end
