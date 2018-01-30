class SessionsController < ApplicationController

  def callback
    auth = request.env['omniauth.auth']
    member = Member.find_by(provider: auth['provider'], uid: auth['uid']) || Member.create_with_omniauth(auth)
    session[:member_id] = member.id
    redirect_back_or root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end
