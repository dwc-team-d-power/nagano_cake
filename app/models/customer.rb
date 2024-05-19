class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cart_item
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def active_for_authentication?
    super && (is_active == true)
  end   
end
