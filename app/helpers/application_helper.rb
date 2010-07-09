module ApplicationHelper
  def admins_only(&block)
    if current_user && current_user.admin?
      block.call
    end
  end


  def authorized?(permission, object, &block)
    if can?(permission.to_sym, object) || (current_user && current_user.admin?)
      block.call
    end
  end
      
 
end
