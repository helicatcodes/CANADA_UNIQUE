# Admin-facing controller for sending user invitations.
# new  — renders a form with a single textarea for one or more email addresses.
# create — splits input by comma/newline, creates a pending Token per email,
#           and sends an invitation email in the background via UserMailer.
class InvitationsController < ApplicationController
  def new
  end

  def create
    # create new tokens with status pending and send mail in the background
    # so admin user does not have to wait in the browser until email was sent
    emails = params[:emails].split(/[\s,]+/)
    emails.each do |email|
      token = Token.create!(email: email, status: "pending", token: SecureRandom.urlsafe_base64)
      UserMailer.invitation(email, token).deliver_later
    end
    redirect_to root_path, notice: "Invitations sent!"
  end
end
