class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logout_required
    redirect_to posts_path if logged_in?
  end

  def login_required
    redirect_to new_user_path, :notice => 'You must sign in first' unless logged_in?
  end

  def admin_required
    redirect_to posts_path, :notice => 'Only admins can do that' unless logged_in? && current_user.admin?
  end

  def logged_in?
    current_user
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
