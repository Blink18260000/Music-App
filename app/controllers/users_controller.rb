class UsersController < ApplicationController

  def new
    if current_user
      redirect_to bands_url
    else
      @user = User.new
      render :new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password, :email, :session_token)
  end
end
