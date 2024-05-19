class Public::ItemsController < ApplicationController
  def index
    if params[:genre_id]
      @items=Item.where(genre_id:params[:genre_id])
    else  
    @items = Item.all
    end 
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @amount = @item.count
  end
end
