class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(10)
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.page(params[:page]).per(10)
    else
      @genres = Genre.all
      @genre = Genre.find_by(id: params[:genre_id]) if params[:genre_id].present?
    end
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end
end
