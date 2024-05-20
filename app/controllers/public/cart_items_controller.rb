class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_items
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path, notice: 'カート内の商品を全て削除しました'
  end

   def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to public_cart_items_path, notice: 'カートに商品を追加しました。'
    else
      render 'public/items/show'
    end
   end
  
  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id,:amount)
    end  
end
