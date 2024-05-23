class ApplicationController < ActionController::Base
  
private

  def after_sign_in_path_for(resource)
    customers_my_page_path(resourse)
  end

  def after_sign_out_path_for(resource)
   root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end
