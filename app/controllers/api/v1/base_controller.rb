class Api::V1::BaseController < ActionController::Base
  before_filter :authenticate_user
  respond_to :json, :xml
  
  private
    def authenticate_user
      @current_user = User.find_by_authentication_token(params[:token])
      unless @current_user
        respond_with({ :error => "Token is invalid." })
      end
    end
end