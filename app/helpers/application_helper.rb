module ApplicationHelper
  def admins_only
    yield if current_user.try(:admin?)
  end


  def authorized?(permission, object, &block)
    yield if can?(permission.to_sym, object) ||
             current_user.try(:admin?)
  end
end
