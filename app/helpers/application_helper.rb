module ApplicationHelper
  def admins_only
    yield if current_user && current_user.admin?
  end


  def authorized?(permission, object, &block)
    if can?(permission.to_sym, object) || (current_user && current_user.admin?)
      block.call
    end
    nil
  end
      
 
end
