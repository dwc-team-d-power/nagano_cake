class Order < ApplicationRecord
    has_many :order_detailes
    belongs_to :customer
    has_many :items
    SHIPPING_COST = 800
    enum payment_method: { credit_card: 0, transfer: 1 }
    enum status:{ payment_confirmation:0,production:1,preparation_for_shipping:2,sent:3}
end
