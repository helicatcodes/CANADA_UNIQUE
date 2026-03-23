class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user!

  # When a user is not authorized, redirect them to the home page with an alert. MJR
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    redirect_to root_path, alert: "Not authorized."
  end
end
