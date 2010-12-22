module ApplicationHelper
  def admins_only(account=current_account, &block)
    if account_admin?(account)
      block.call
    end
    nil
  end

  def authorized?(permission, object, &block)
    if can?(permission.to_sym, object) || account_admin?(current_account)
      block.call
    end
    nil
  end
  
  private
  
  def account_admin?(account)
    current_user && current_user.admin_accounts.include?(account)
  end
end
