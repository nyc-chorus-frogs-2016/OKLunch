class SessionsController < ApplicationController
  skip_before_action :ensure_current_user

  def new
  end

  def create
    if request.env["omniauth.auth"]
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to root_url
    else
      user = User.find_by(name: params[:name])
      if
        user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash.notice = "Welcome back to OKLunch #{user.name}"
        redirect_to root_path
      else
        flash[:error] = 'Login failed'
        render :new
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
