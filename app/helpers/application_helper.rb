module ApplicationHelper
  def admins_only(&block)
    block.call if current_user.try(:admin?)
    nil
  end


  def authorized?(permission, object, &block)
    block.call if can?(permission.to_sym, object) ||
               current_user.try(:admin?)
    nil
  end
end
