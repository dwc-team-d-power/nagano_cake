class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def my_page
    @customer = current_customer
  end

  def information_edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_my_page_path,notice:'会員情報が更新されました'
    else 
      render :edit 
    end   
  end

  def unsubscribe
  end

  def withdraw
  end
  private   
  def customer_params
    params.require(:customer).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:telephone_number,:email)
  end   
end
