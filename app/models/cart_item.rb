class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item
    
    validates :amount, numericality: { greater_than: 0, message: "は1以上にしてください" }
    def subtotal
      item.with_tax_price * amount
    end 
end
