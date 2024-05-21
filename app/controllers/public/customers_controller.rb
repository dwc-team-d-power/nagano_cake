class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def my_page
    @customer = current_customer
  end

  def edit
    # @customer = Customer.find(params[:id])
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
    @customer = Customer.find(current_customer.id)
    @customer.update(is_active: false)
    reset_session 
    flash[:notice]="退会処理を実行いたしました"
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:telephone_number,:email)
  end   
end
