class Order < ApplicationRecord
    has_many :order_detailes
    belongs_to :customer
    has_many :items,through: :order_detail
    attr_accessor :address_option
    enum payment_method: { credit_card: 0, transfer: 1 }
    enum status:{ payment_confirmation:0,production:1,preparation_for_shipping:2,sent:3}
    def full_address
     "〒#{postal_code}#{address}#{name}"
    end     
    def with_tax_price
       (cart_item.price*1.1).floor
    end    
    def subtotal
      items.with_tax_price*amount
    end 
end 
