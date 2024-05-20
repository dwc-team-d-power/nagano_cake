class ApplicationController < ActionController::Base
      
  def admin_user?
    admin.email == current_user.email && admin.encrypted_password == current_user.encrypted_password
  end

end
