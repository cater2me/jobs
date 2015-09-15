class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Invalid Login"]
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    logout(@user)
    redirect_to new_session_url
  end

end
