class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_customer, only: [:show, :edit, :update, :destroy, :restore]

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end
  
  def destroy
    @customer.destroy
    redirect_to admin_customers_path, notice: "顧客情報を削除しました。"
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      flash[:success] = "顧客情報を更新しました。"
      redirect_to admin_customer_path(@customer)
    else
      flash.now[:danger] = "顧客情報の更新に失敗しました。"
      render :edit
    end
  end

  def restore
    @customer.restore
    redirect_to admin_customers_path, notice: "顧客情報を復元しました。"
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end
end
