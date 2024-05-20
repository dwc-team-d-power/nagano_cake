class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  has_many :orders, through: :order_details

  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :genre, presence: true
  validates :price_excluding_tax, presence: true, numericality: { only_integer: true, greater_than: 0 }
    belongs_to :genre
    belongs_to :cart_item
    has_one_attached :image
    def with_tax_price
        (price*1.1).floor
    end    
end
