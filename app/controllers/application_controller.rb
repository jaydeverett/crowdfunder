class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # helper_method :current_user
  # def current_user
  #   user_sessions[:user_id] && User.find(user_sessions[:user_id])
  # end
  private
  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
