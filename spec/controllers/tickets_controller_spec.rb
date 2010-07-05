require 'spec_helper'

describe TicketsController do
  before do
    stub_warden
  end

  let(:user) { User.create(:email => "user@ticktee.com", :password => "password", :password_confirmation => "password") }
  let(:project) { Project.create(:name => "Ticketee") }
  let(:ticket) { project.tickets.create(:title => "Restrict permissions", :description => "For the tickets controller.")}

  context "standard users" do
    it "cannot access a ticket for a project they don't have access to" do
      sign_in_as(user)
      get :show, :id => ticket.id, :project_id => project.id
      response.should redirect_to(root_path)
      flash[:alert].should eql("The project you were looking for could not be found.")
    end

    it "cannot begin to create a ticket without access to the project" do
      sign_in_as(user)
      get :new, :project_id => project.id
      response.should redirect_to(root_path)
      flash[:alert].should eql("The project you were looking for could not be found.")
    end

    it "cannot begin to create a ticket without permission" do
      sign_in_as(user)
      Permission.create(:user => user, :object => project, :action => "read")
      get :new, :project_id => project.id
      response.should redirect_to(project)
      flash[:alert].should eql("You are not allowed to create tickets on this project.")
    end
  end
end
