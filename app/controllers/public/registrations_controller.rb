class Public::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  protected

  def after_sign_up_path_for(resource)
    my_page_customer_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :first_name, :last_name, :first_name_kana, :last_name_kana,
      :postal_code, :address, :telephone_number, :email, :password, :password_confirmation
    ])
  end
end