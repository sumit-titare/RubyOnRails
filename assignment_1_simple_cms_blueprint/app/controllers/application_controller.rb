class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  private
# redirect_to prevents requested action from running
  def confirm_logged_in
    unless session[:user_id]
      flash[:message] = "Please Login!"
      redirect_to(access_login_path)
    end
  end
end
