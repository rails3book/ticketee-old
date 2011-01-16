module ApplicationHelper
  def admins_only
    yield if current_user && current_user.admin?
  end
end
