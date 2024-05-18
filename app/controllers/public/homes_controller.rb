class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all.order(creaated_at: :desc)
  end

  def about
  end
end
