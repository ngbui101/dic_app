class SessionsController < ApplicationController
  def create 
    @user = User.find_by(username: params[:username])
    if !!@user && @user.authenticate(params[:password])
      flash[:success] = "erfoglgreich eingeloggt! Willkommen zurück #{@user.username}"
      session[:user_id] = @user.id
      redirect_to @user
    else 
      flash[:success] = "falsche Passwort oder Username"
      redirect_to login_path
    end
  end

  def destroy
    helpers.log_out
    flash[:success] = "erfoglgreich ausgeloggt"
    redirect_to root_path
  end

end
