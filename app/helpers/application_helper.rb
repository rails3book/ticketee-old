module ApplicationHelper
  def admins_only
    yield if current_user && current_user.admin?
  end


  def authorized?(permission, object, &block)
    yield if can?(permission.to_sym, object) ||
             (current_user && current_user.admin?)
  end
end
