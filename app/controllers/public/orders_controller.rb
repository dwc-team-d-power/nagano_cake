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
  end

  def index
    @orders = current_customer.id
    @orders = Orderes.all 
  end

  def show
    @order = Orders.find([params:id])
  end
end
