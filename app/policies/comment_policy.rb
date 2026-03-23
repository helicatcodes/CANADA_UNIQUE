# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  # Only regular users and admins can post comments. MJR
  def create?
    admin? || user.user?
  end

  # Only the comment owner or an admin can delete. MJR
  def destroy?
    admin? || record.user == effective_user
  end
end
