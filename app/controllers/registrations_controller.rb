# Overrides Devise's RegistrationsController to enforce invitation-only sign up.
# create — validates the token from the hidden form field before allowing registration.
#           Marks the token as accepted after the user is successfully created.
class RegistrationsController < Devise::RegistrationsController
  def create
    @token = Token.find_by(token: params[:user][:token])

    if @token.nil? || !@token.pending?
      redirect_to root_path, alert: "Invalid or expired invitation."
      return
    end

    super do |user|
      if user.persisted?
        @token.accepted!
      end
    end
  end
end
