class AccessController < ApplicationController

  layout 'navbar'

  before_action :confirm_logged_in, except: [:login, :attempt_login]

  def menu
    #menu
  end

  def login
    redirect_to(access_menu_path) if session[:user_id]
    #login form
  end

  def attempt_login
    if params[:username].present? || params[:password].present?
      attempted_user = AdminUser.where(username: params[:username]).first
      if attempted_user
        authenticated_user = attempted_user.authenticate(params[:password])
      end
    end

    if authenticated_user
        session[:user_id] = authenticated_user&.id
        session[:username] = authenticated_user&.username
        flash[:message] = "Login successfull!!"
        redirect_to(access_menu_path)
    else
    # flash.now(): will only store for next request.
      flash.now[:message] = "Incorrect credentials! Try again."
      render('login')
    end
  end

  def logout
    session[:user_id] = nil
    flash[:message] = "Logged out successfully!!"
    redirect_to(access_login_path)
  end
end
