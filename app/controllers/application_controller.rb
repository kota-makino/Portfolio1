class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger
end
