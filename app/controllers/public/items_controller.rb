class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(10)
    @genres = Genre.all
    @genre = Genre.find_by(id: params[:genre_id]) if params[:genre_id].present?
  end

  def show
    @item = Item.find(params[:id])
    # @amountを削除または適切な処理に変更
  end
end

