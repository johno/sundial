class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

    def user_not_authorized
      flash[:error] = "Sorry, you're not allowed to do that."
      redirect_to request.headers["Referer"] || root_path
      return
    end
end
