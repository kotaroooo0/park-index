class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  include SkiresortsHelper

  def logged_in_user?
    return if logged_in?
    store_location
    flash[:info] = "ログインしてください"
    redirect_to login_url
  end

  def correct_user?
    return if current_user.id == session[:user_id]
    store_location
    flash[:info] = "正しいユーザーではありません"
    redirect_to root_url
  end

  def profile_image(img)
    img.blank? ? "profile_pic.jpeg" : img
  end

end
