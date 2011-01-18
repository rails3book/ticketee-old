class Api::V1::ProjectsController < Api::V1::BaseController
  def index
    projects = Project.readable_by(@current_user)
    respond_with(projects)
  end
  
  def create
    project = Project.create(params[:project])
    respond_with(project)
  end
end