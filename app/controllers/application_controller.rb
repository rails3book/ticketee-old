class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  def authorize_admin!
    authorize_user!
    unless current_user.admin?
      flash[:notice] = "You must be an admin to do that."
      redirect_to root_path
    end
  end 
end
