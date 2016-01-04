class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_phone(params[:phone])
    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      #session[:user_id] = @user.id
      if params[:remember_me]
        cookies.permanent[:auth_token] = @user.auth_token
      else
        cookies[:auth_token] = @user.auth_token
      end
      redirect_to user_path(@user)
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to :back
    end
  end

  def show

  end

  def destroy
    #session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to root_url
  end


end
