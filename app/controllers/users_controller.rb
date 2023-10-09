class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Erfolgreich registiert! Hallo #{@user.username}"
      redirect_to root_path
    else 
      flash[:success] = "fehlerhaft registiert"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end

end
