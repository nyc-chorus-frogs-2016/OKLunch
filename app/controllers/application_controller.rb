class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user

  before_action :ensure_current_user #WITH SOME EXCEPTIONS

  def current_user
    user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def ensure_current_user
    unless current_user do
      flash.notice = "you must be logged in to continue"
      redirect_to new_session_path
    end
  end

end
end
