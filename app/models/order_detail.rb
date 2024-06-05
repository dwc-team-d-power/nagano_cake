class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum production_status: { cannot_start: 0, waiting_for_production: 1, in_production: 2, production_complete: 3 }

  def subtotal
    price * amount
  end
end
