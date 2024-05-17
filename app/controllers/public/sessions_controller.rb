# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
<<<<<<< HEAD
  # before_action :configure_sign_in_params, only: [:create]
 
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
=======
  before_action :customer_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  GET /resource/sign_in
  def new
    super
  end

  POST /resource/sign_in
  def create
    super
  end

  DELETE /resource/sign_out
  def destroy
    super
  end

  protected
  
  def after_sign_in_path_for(resource)
    public_homes_top_path
  end
  
  def after_sign_out_path_for(resource)
    public_homes_top_path
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
  return unless customer.is_active == true
  redirect_to new_customer_registration_path
  end
>>>>>>> origin/sakamoto

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
<<<<<<< HEAD
  private
    def user_state
      @user=User.find_by(email:params[:user][:email])
      return if customer.nil?
      return unless cutomer.valid_password?(params[:user][:password])
      @user.create
      render user_sign_up
    end   
=======
>>>>>>> origin/sakamoto
end
