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

  def share_phone
    debugger
    @user = User.find_by_id(params[:id])

    if (SharedPhone.all.collect(&:phone).include?(params[:phone]) or User.all.collect(&:phone).include?(params[:phone]))
      @user.shared_phones.create({:phone => params[:phone], :status => false, :credit_given => 0})
      @output = {"status" => "fail", "message" => "Phone number not shared"}
    else
      @user.shared_phones.create({:phone => params[:phone], :status => true, :credit_given => 3})
      @output = {"status" => "success", "message" => "Phone number shared"}
    end
    render :json => @output.to_json
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :address, :password, :password_confirmation)
  end

end
