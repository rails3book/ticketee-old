require 'spec_helper'

describe ProjectsController do
  before do
    stub_warden
  end

  let(:user) { User.create!(:login => "user", :password => "ticketee", :password_confirmation => "ticketee", :email => "user@ticketee.com") }
  let(:project) { Project.create!(:name => "Ticketee") }

  it "displays an error message when asked for a missing project" do
    sign_in_as(user)
    get :show, :id => "not-here"
    response.should redirect_to(projects_path)
    flash[:alert].should eql("The project you were looking for could not be found.")
  end

  describe "standard users" do
    { "new" => "get", "create" => "post", "edit" => "get", "update" => "put", "destroy" => "delete" }.each do |action, method|
      it "cannot access the #{action} action" do
        sign_in_as(user)
        send(method, action, :id => project.id)
        response.should redirect_to(root_path)
        flash[:alert].should eql("You must be an admin to do that.")
      end
    end

    it "cannot access the show action" do
      sign_in_as(user)
      get :show, :id => project.id
      response.should redirect_to(projects_path)
      flash[:alert].should eql("The project you were looking for could not be found.")
    end
  end
end
