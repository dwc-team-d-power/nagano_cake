class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_item.all
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path, notice: 'カート内の商品が更新されました。'
    else
      redirect_to cart_items_path, alert: 'カート内の商品更新に失敗しました。'
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path, notice: 'カート内の商品が削除されました。'
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path, notice: 'カート内の全ての商品が削除されました。'
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path, notice: 'カートに商品が追加されました。'
    else
      redirect_to items_path, alert: 'カートへの商品追加に失敗しました。'
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
