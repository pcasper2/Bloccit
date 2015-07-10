class CommentPolicy < ApplicationPolicy
  def new
    create?
  end

  def create?
    user.present?
  end

  def destroy?
    user.present? && (record.user == user || user.moderator? || user.admin?)
  end
end
