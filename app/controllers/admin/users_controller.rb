class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all(:order => "email")
  end
end
