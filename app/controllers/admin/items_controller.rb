class Admin::ItemsController < ApplicationController
  # before_action :authenticate_admin!
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.all 
    # @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "商品の新規登録が完了しました。"
      redirect_to admin_item_path(@item)
    else
      flash[:error] = @item.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item.update(item_params)
      flash[:success] = "商品詳細の変更が完了しました。"
      redirect_to admin_item_path(@item)
    else
      flash.now[:danger] = "商品詳細の変更内容に不備があります。"
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :genre_id, :price, :is_active, :image, :introduction)
  end
end
