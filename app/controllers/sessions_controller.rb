class SessionsController < ApplicationController
  def create 
    @user = User.find_by(username: params[:username])
    if !!@user && @user.authenticate(params[:password])
      flash[:success] = "Login succes! #{@user.username}"
      session[:user_id] = @user.id
      redirect_to @user
    else 
      flash[:success] = "Something went wrong! Make sure your username and password are corret"
      redirect_to login_path
    end
  end

  def destroy
    helpers.log_out
    flash[:success] = "You're logged out"
    redirect_to root_path
  end

end
