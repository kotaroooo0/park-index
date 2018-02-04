class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  include SkiresortsHelper

  def logged_in_user?
    return if logged_in?
    store_location
    flash[:danger] = "ログインしてください"
    redirect_to login_url
  end

  def simple_time(time)
    time.strftime("%Y-%m-%d　%H:%M　")
  end

end
