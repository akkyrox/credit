class UsersController < ApplicationController

  def index
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "User signed_up"
    else
      redirect_to :back
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :address, :password, :password_confirmation)
  end

end
