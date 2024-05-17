class Item < ApplicationRecord

  has_many :cart_items
    has_many :ordered_items
    attachment :image
    belongs_to :genre

    enum sales_status: { on_sale: 0, off_sale: 1 }


end
