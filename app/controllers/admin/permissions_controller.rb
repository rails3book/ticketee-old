class Admin::PermissionsController < ApplicationController
  before_filter :find_user
  
  def index
    @ability = Ability.new(@user)
    @projects = Project.all
  end

  private

    def find_user
      @user = User.find(params[:user_id])
    end
end
