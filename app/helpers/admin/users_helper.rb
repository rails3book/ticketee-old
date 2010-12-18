module Admin::UsersHelper
  def display(user)
    @admins ||= current_account.admins
    suffix = " (Admin)" if @admins.include?(user)
    link_to("#{user}#{suffix}", admin_user_path(account, user))
  end
end
