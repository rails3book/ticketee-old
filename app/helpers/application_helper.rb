module ApplicationHelper
  def admins_only(account, &block)
    if current_user && @admin_accounts.include?(account)
      block.call
    end
    nil
  end

  def authorized?(permission, object, &block)
    if can?(permission.to_sym, object) || (current_user && current_user.admin?)
      block.call
    end
    nil
  end
      
 
end
