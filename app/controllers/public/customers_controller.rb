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
      flash[:notice] = "会員情報が更新されました"
      redirect_to my_page_customer_path
    else
      render :information_edit
    end
  end

  def unsubscribe
    # ロジックを追加する場合はこちらに記述
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :address, :postal_code, :telephone_number, :email)
  end
end
