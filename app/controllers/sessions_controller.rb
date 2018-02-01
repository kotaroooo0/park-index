class SessionsController < ApplicationController

  def callback
    auth = request.env["omniauth.auth"]
    user = User.find_by(provider: auth["provider"], uid: auth["uid"]) || User.create_with_facebook(auth)
    session[:user_id] = user.id
    @auth = auth
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end
