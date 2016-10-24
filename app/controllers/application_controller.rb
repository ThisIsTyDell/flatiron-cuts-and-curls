class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || user_path(current_user)
  end

  def user_not_authorized(exception)
    flash[:error] = "Access denied."
    redirect_to(request.referrer || :root)
  end
end
