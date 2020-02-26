class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def is_admin?
    if current_user && current_user.admin?
    redirect_to "/admins"
    end
  end
  helper_method :is_admin?

  def not_admin?
    if current_user.admin == false
      redirect_to "/sound_mynds"
    end
  end
  helper_method :not_admin?


  private
  def require_login
    if session[:user_id] == nil
      redirect_to '/users'
    end
  end
end
