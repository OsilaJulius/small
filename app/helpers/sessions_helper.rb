module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    end
  end

  def is_signed_in?
    !current_user.nil?
  end

  def is_current_user?(user)
    user == current_user
  end

  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end
end
