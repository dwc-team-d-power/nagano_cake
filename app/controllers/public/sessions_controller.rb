# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
 before_action :customer_state, only: [:create]
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected
  
  def after_sign_in_path_for(resource)
    customer_my_page_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  private
  # アクティブであるかを判断するメソッド
  def customer_state
  # 【処理内容1】 入力されたemailからアカウントを1件取得
  customer = Customer.find_by(email: params[:customer][:email])
  # 【処理内容2】 アカウントを取得できなかった場合、このメソッドを終了する
  return if customer.nil?
  # 【処理内容3】 取得したアカウントのパスワードと入力されたパスワードが一致していない場合、このメソッドを終了する
  return unless customer.valid_password?(params[:customer][:password])
  # 【処理内容4】 アクティブでない会員に対する処理
  return unless customer.is_active ==false
  redirect_to new_customer_registration_path
  end
  protected 
      def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :first_name, :last_name, :first_name_kana, :last_name_kana, 
      :postal_code, :address, :telephone_number, :email, :password, :password_confirmation
    ])
      end
end   