class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end
 def create
    existing_cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
  if existing_cart_item
    # 存在した場合
    # 2. カート内の個数をフォームから送られた個数分追加する
    existing_cart_item.amount += params[:cart_item][:amount].to_i
    if existing_cart_item.save
      flash[:notice]="カートに商品が追加されました"
      redirect_to cart_items_path
    else
      redirect_to item_path(params[:cart_item][:item_id])
    end
  else
    # 存在しなかった場合
    # カートモデルにレコードを新規作成する
    @cart_item = current_customer.cart_items.new(cart_item_params)
    existing_cart_item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
    if existing_cart_item.present?
      existing_cart_item.amount += @cart_item.amount
      existing_cart_item.save
    elsif @cart_item.save
      # do nothing
    else
      redirect_to item_path(params[:cart_item][:item_id])
    end
    redirect_to cart_items_path
  end
 end
    
  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice]="カートアイテムを更新しました"
      redirect_to cart_items_path
    else
      render :index
    end   
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

   
  
  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end
end
