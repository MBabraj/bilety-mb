class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # helper_method :current_order

  # def current_order
  #   if !session[:order_id].nil?
  #     Order.find(session[:order_id])
  #   else
  #     Order.new
  #   end
  # end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  def is_admin?
    redirect_to events_path, alert: "Not authorized" if current_user.nil? or current_user.admin?
  end


end
