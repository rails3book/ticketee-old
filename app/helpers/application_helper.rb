module ApplicationHelper
  def admins_only(&block)
    if current_user && current_user.admin?
      block.call
    end
  end
end
