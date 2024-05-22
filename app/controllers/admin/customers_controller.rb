class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_customer, only: [:show, :edit, :update]

  def index
    @customers = Customer.all
  end

  def show
    @admins_customers = Customer.find(params[:id])
    @orders = @admins_customers.orders.page(params[:page]).reverse_order
  end

  def edit
    @admins_customer = Customer.find(params[:id])
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

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
  end
  
  def customer_restore
    @admin_customer = Customer.deleted.find(params[:id]).restore
    redirect_to admin_customers_path
  end

  def destroy
    @admins_customer = Customer.find(params[:id])
    @admins_customer.destroy
    redirect_to admin_customers_path
  end
  
end
