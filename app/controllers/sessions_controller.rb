class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to bands_url
    else
      @user = User.new
      render :new
    end
  end

  def create
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if @user
      session[:session_token] = @user.reset_session_token!
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Invalid Credentials"]
      @user = User.new(user_name: params[:user][:user_name])
      render :new
    end
  end

  def destroy
    if current_user
      current_user.reset_session_token!
      session[:session_token] = nil
    end
    redirect_to new_session_url
  end
end
