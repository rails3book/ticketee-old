class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_states
  
  private
  
  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
  
  def find_project
    @project = Project.for(current_user).find(params[:project_id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The project you were looking for could not be found."
      redirect_to root_path
  end

  def find_states
    @states = State.all
  end
end
