module SessionsHelper

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user?(user)
    user == current_user
  end

end
