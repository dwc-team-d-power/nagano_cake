class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
  end

  def destroy
    @cart_item = Cartitem.find(params[:id])
    @cart_item.destroy
  end

  def destroy_all
    current.customer.cart_items.destroy_all
  end

  def create
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end
end
