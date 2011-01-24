class AuthenticationController < ApplicationController
  def login
    if params[:super_user_name] == SUPERUSER_NAME && params[:super_user_pass] == SUPERUSER_PASS
      session[:superuser] = true
      redirect_to posts_url
    end
  end

  def logout
    session[:superuser] = false
    redirect_to login_path
  end
end