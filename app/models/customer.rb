class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
<<<<<<< HEAD
=======
  has_many :cart_items
  has_many :orders
  has_many :addresses
  has_many :items,through: :cart_items
>>>>>>> takeshiumemoto
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :items, through: :cart_items
  
  def full_name
    "#{last_name} #{first_name}"
  end
  
  def full_name_kana
    "#{last_name_kana} #{first_name_kana}"
  end
  
  def customer_status
    is_active ? "有効" : "退会"
  end

  def active_for_authentication?
    super && is_active
  end
  
  def name
    "#{first_name} #{last_name}"
  end 
  
  def full_address
    "〒#{postal_code} #{address} #{name}"
  end
end
