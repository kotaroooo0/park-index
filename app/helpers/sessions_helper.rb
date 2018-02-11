module SessionsHelper

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !session[:user_id].nil?
  end

  def current_user?(user)
    user == current_user
  end

  def redirect_back_or(default)
    redirect_to(session[:forwording_url] || default)
    session.delete(:forwording_url)
  end

  def store_location
    session[:forwording_url] = request.original_url if request.get?
  end
  
end
