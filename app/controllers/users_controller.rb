class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      flash[:error] = "#{@user.errors.full_messages.join(". ")}"
      render 'new'
    end
  end

  def show
    if params[:id]
      @user = User.find(params[:id])
    elsif session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to '/'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user.update(user_params)  #only parameter by default is ID, so this is a security thing (user_params - private method)
    if @user.save
      redirect_to @user
    else
      flash[:error] = "#{@user.errors.full_messages.join(". ")}"
      render 'edit'
    end
  end

  def destroy
    session[:user_id] = nil
    @user.destroy
  end


private

  def set_user
      @user = User.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the whitelist through.
    def user_params
      params.require(:user).permit(
        :name,
        :password,
        :email,
        :admin
      )
    end

end
