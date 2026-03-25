# Represents a single-use invitation token sent to a prospective user.
# Status flow: pending → accepted (on successful registration) or expired.
# enum guards against invalid status values from inside the code;
# add validates :status, inclusion for user-facing input if needed.
class Token < ApplicationRecord
  enum :status, { pending: "pending", accepted: "accepted", expired: "expired" }
end
