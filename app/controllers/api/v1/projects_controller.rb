class Api::V1::ProjectsController < Api::V1::BaseController
  def index
    self.response_body = Project.readable_by(@current_user).to_json
    self.content_type = "text/json"
  end
end