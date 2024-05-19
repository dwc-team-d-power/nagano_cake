class Admin::CustomersController < ApplicationController

  def index
    @admins_customers = Customer.all
  end

  def show
    @admins_customers = Customer.find(params[:id])
    @orders = @admins_customers.orders.page(params[:page]).reverse_order
  end

  def edit
    @admins_customer = Customer.find(params[:id])
  end

  def update
    @admins_customer = Customer.find(params[:id])
       if @admins_customer.update(customer_params)
      redirect_to admin_customer_path(@admins_customer.id), notice: '更新しました。'
   else
      render :edit
   end
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
private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :deleted_at)
  end

  
end
