class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_login, :admin_only, :user_check
  include SessionsHelper
  include UsersHelper

  def user_exists?
    User.exists?(id: session[:user_id])
  end

  def current_user
    if !session[:user_id].nil? && User.exists?(id: session[:user_id])
      User.find(session[:user_id])
    else
      session[:user_id] = nil
      return nil
    end
  end

  def user_check(user_id)
    current_user.id == user_id ? TRUE : FALSE
  end

  def require_login
    unless current_user
      redirect_to root_url
    end
  end

end #end of the controller 
