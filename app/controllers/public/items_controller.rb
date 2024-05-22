class Public::ItemsController < ApplicationController
  def index
<<<<<<< HEAD
    @items = Item.page(params[:page]).per(10)
=======
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items
    else
      @items = Item.all
    end
>>>>>>> origin/takeshiumemoto
    @genres = Genre.all
    @genre = Genre.find_by(id: params[:genre_id]) if params[:genre_id].present?
  end
  def show
    @item = Item.find(params[:id])
<<<<<<< HEAD
    # @amountを削除または適切な処理に変更
  end
end

=======
    @genres = Genre.all
    @cart_item = CartItem.new
  end
end 
>>>>>>> origin/takeshiumemoto
