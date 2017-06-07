class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def signed_in_user
    unless is_signed_in?
      flash[:danger] = "Please sign in first."
      redirect_to root_url
    end
  end
end
