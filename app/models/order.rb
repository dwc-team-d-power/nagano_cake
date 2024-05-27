class Order < ApplicationRecord
    has_many :order_details,dependent: :destroy
    belongs_to :customer
    attr_accessor :address_option
    has_one :ordered_item
    has_many :ordered_items

     has_one_attached :image
    
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
    def status_in_japanese
        I18n.t("enums.order.status.#{status}")
    end     
end 
   
