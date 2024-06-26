class Item < ApplicationRecord
    belongs_to :genre
    has_many :cart_items
    has_many :order_details
    
    validates :name, presence: true
    validates :introduction, presence: true
    validates :genre_id, presence: true
    validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
      
    has_one_attached :image
    
    def with_tax_price
        (price*1.1).floor
    end
    
    def self.looks(word)
      Item.where("name LIKE?","%#{word}%")
    end
end
