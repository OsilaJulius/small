class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
      redirect_to @user
    elsif params[:session][:email].empty? || params[:session][:password].empty?
      flash.now[:danger] = 'Email or password must not be blank!'
      render 'new'
    else
      flash.now[:danger] = 'Email or password is incorrect!'
      render 'new'
    end
  end

  def destroy
    sign_out if is_signed_in?
    redirect_to root_url
  end
end
