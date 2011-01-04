class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_states
  
  private
  
  def authorize_admin!
    authenticate_user!
    unless current_user.accounts.
             where("account_users.admin = ? AND account_users.account_id = ?", 
                   true, current_account.id).exists?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
  
  def current_account
    @account ||= Account.find(params[:account_id])
  end
  
  helper_method :current_account
  
  def find_project
    @project = current_account.projects_for(current_user).find(params[:project_id])
    rescue ActiveRecord::RecordNotFound
      p params
      puts "COULD NOT FIND PROJECT FOR USER."
      flash[:alert] = "The project you were looking for could not be found."
      redirect_to root_path
  end

  def find_states
    @states = State.all
  end
  
  def admin?
    current_account.admins.include?(current_user)
  end
end
