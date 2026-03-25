# Handles the invitation link clicked by the prospective user.
# verify — looks up the token from the URL, redirects to Devise sign up if pending,
#           or back to root with an alert if invalid/expired.
#           Skips authentication so unauthenticated users can access the link.
class TokensController < ApplicationController

  skip_before_action :authenticate_user!, only: [:verify]

  def verify
    @token = Token.find_by(token: params[:token])
    if @token&.pending?
      redirect_to new_user_registration_path(token: params[:token])
    else
      redirect_to root_path, alert: "Your invitation has expired. Contact the admin"
    end
  end
end
