class Public::ItemsController < ApplicationController
  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.page(params[:page]).per(10)
    else
      @items = Item.all.page(params[:page]).per(10)
    end
    @genres = Genre.all
  end
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end
end 
