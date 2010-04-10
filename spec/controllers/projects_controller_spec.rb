require 'spec_helper'

describe ProjectsController do
  before do
    stub_warden
    @user = User.create!(:login => "user", :password => "ticketee", :password_confirmation => "ticketee", :email => "user@ticketee.com")

  end

  it "displays an error message when asked for a missing project" do
    get :show, :id => "not-here"
    response.should redirect_to(projects_path)
    flash[:alert].should eql("The project you were looking for could not be found.")

  { "new" => "get", "create" => "post", "edit" => "get", "update" => "put", "destroy" => "delete" }.each do |action, method|
    it "standard users cannot access the #{action} action" do
      login_as(@user)
      send(method, action, :id => "1")
      response.should redirect_to(root_path)
      flash[:alert].should eql("You must be an admin to do that.")
    end
  end
end
