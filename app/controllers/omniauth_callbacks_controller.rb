class OmniauthCallbacksController < ApplicationController

  def create
    if omni?
       session[:user_id] = @user.id
       log_in(@user)
       redirect_to @user
       #redirect_to request.env['omniauth.origin']
       #devise <> check this out
     else
       flash[:error] = 'Invalid email/password combination'
       render 'new'
     end
  end

  private

  def from_omniauth(auth)
    # give me the user where provider & uid || email: auth.info.email
    User.where(
      "(provider = ? AND uid = ?) OR email = ?",
      auth.provider, auth.uid, auth.info.email
    ).first_or_initialize.tap do |user|
      user.email = auth.info.email
      user.uid = auth.uid
      user.provider = auth.provider

      user.save!
    end
  end

  def omni?
    @user = from_omniauth(request.env["omniauth.auth"])
    answer = @user.valid?
  end
end
