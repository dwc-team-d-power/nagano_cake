class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_items.includes(:item)
  end
  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path, notice: 'カートに商品を追加しました。'
    else
      redirect_to item_path(params[:cart_item][:item_id]), alert: 'カートに商品を追加できませんでした。'
    end
  end
  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path,notice:'カートアイテムを更新しました'
    else
      render :index,alert:'カートアイテムの更新に失敗しました'
    end   
  end

  def destroy
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path, notice: 'カートアイテムを削除しました。'
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path, notice: 'カート内の商品を全て削除しました'
  end

   
  
  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id,:amount)
    end  
end
