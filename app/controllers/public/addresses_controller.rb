class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  # before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  def index
    @address = Address.new
    @addresses = Address.all
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(update_address_params)
    redirect_to addresses_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end
  
    private

  def address_params
    params.require(:address).permit(:name, :postal_code, :address, :customer_id)
  end
  
  def update_address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end
  
  def is_matching_login_user
    address = Address.find(params[:id])
    customer = Customer.find(address.customer_id)
    unless customer.id == current_user.id
      redirect_to root_path
    end
  end
end
