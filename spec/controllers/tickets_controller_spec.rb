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

    context "with permission to view the project" do
          
      before do
        sign_in_as(user)
        Permission.create(:user => user, :object => project, :action => "read")
      end

      def cannot_create_tickets!
        response.should redirect_to(project)
        flash[:alert].should eql("You are not allowed to create tickets on this project.")
      end

      def cannot_update_tickets!
        response.should redirect_to(project)
        flash[:alert].should eql("You are not allowed to edit tickets on this project.")
      end
        
      it "cannot begin to create a ticket without permission" do       
        get :new, :project_id => project.id
        cannot_create_tickets!
      end
    
      it "cannot create a ticket without permission" do
        post :create, :project_id => project.id
        cannot_create_tickets!
      end

      it "cannot edit a ticket without permission" do
        get :edit, { :project_id => project.id, :id => ticket.id }
        cannot_update_tickets!
      end

      it "cannot update a ticket without permission" do
        put :update, { :project_id => project.id, :id => ticket.id }
        cannot_update_tickets!
      end

      it "cannot delete a ticket without permission" do
        delete :destroy, { :project_id => project.id, :id => ticket.id }
        response.should redirect_to(project)
        flash[:alert].should eql("You are not allowed to delete tickets from this project.")
      end
    end
  end
end
