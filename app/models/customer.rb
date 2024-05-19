class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cart_items
  has_many :orders
  has_many :addresses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def active_for_authentication?
    super && (is_active == true)
  end   
  
  def name 
    first_name + last_name 
  end 
  
  def customer_info
    "#{postal_code}#{address}#{name}"
  end 
end
