class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?, :user_params

  def user_params
    params.require(:users).permit(:username, :password)
  end

  def login(user)
    user.reset_session_token
    session[:session_token] = user.session_token
    # debugger
  end

  def logout
    session[:session_token] = nil
  end

  def logged_in?
  
    !!current_user
  end

  def current_user
    # debugger
    User.find_by(session_token: session[:session_token])
  end
end
