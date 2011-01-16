class Api::V1::BaseController < ActionController::Metal
  include AbstractController::Callbacks
  before_filter :authenticate_user
  
  private
    def authenticate_user
      @current_user = User.find_by_authentication_token(params[:token])
      if @current_user.nil?
        self.response_body = { :error => "Token is invalid." }.to_json
        self.content_type = "text/json"
      end
    end
end