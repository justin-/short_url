class SessionsController < ApplicationController

  # HACK: This sucks why do we have to do it? https://github.com/intridea/omniauth/wiki/FAQ
  skip_before_filter :verify_authenticity_token
  
  def new
  end
  
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path, notice: "Signed in as user #{user.email} (id: #{user.id})"
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Signed out"
  end

end
