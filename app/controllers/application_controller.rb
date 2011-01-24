class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def require_super_user
    redirect_to login_path if session[:superuser].nil? or session[:superuser] == false
  end
end
