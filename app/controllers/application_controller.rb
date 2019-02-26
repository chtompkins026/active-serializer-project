class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_login, :admin_only, :user_check
  include SessionsHelper
  include UsersHelper 

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

    def admin_only
      if current_user.admin
        return true
      else
        flash[:notice] = "You are not an admin, so you can't do this function"
        redirect_to user_path(current_user)
      end
    end

  end
