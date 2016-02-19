class SessionsController < ApplicationController
  skip_before_action :ensure_current_user

  def new
  end

  def destroy
    session.clear
    redirect_to new_session_path
  end
  #this is the copy pasted version from online
  # def create
  #   auth_hash = request.env['omniauth.auth']
  #   binding.pry
  #   @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
  #   if @authorization
  #     render :text => "Welcome back #{@authorization.user.name}! You have already signed up."
  #   else
  #     user = User.new :name => auth_hash["user_info"]["name"], :email => auth_hash["user_info"]["email"]
  #     user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
  #     user.save
  #     render :text => "Hi #{user.name}! You've signed up."
  #   end
  # end

  def create
    if request.env["omniauth.auth"]
      auth = request.env["omniauth.auth"]
      session[:omniauth] = auth.except('extra')
      user = User.sign_in_from_omniauth(auth)
      session[:user_id] = user.id
      redirect_to questions_path
    else
      user = User.where("uid = ? AND provider = ?", params[:uid], "OKLunch")[0]
      binding.pry
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash.notice = "Welcome back to OKLunch #{user.name}"
        redirect_to restaurants_path
      else
        flash[:error] = 'Login failed'
        render :new
      end
    end
  end

protected

def auth_hash
  request.env['omniauth.auth']
end
end
