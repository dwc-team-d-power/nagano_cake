class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item_id
    def subtotal
        item.with_tax_price*amount
    end     
end
