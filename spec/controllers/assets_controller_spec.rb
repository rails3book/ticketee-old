require 'spec_helper'

describe AssetsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "sending files" do
    let(:user) { User.create!(:email => "user@ticketee.com", :password => "password", :password_confirmation => "password") }
    let(:other_user) { User.create!(:email => "other_user@ticketee.com", :password => "password", :password_confirmation => "password") }
    let(:project) { Project.create!(:name => "Ticketee") }
    let(:ticket) { project.tickets.create!(:title => "Patch for blink tag", :description => "Documenting speed attribute", :user => user)}
    let(:asset) { ticket.assets.create!(:asset => File.open(Rails.root + "spec/fixtures/speed.txt")) }
    
    before do
      Permission.create(:object => project, :user => user, :action => "read")
    end
    
    it "to users without permission" do
      stub_warden
      sign_in_as(other_user)
      get :show, :id => File.basename(asset.asset.path), :ticket_id => ticket.id, :project_id => project.id
      response.should redirect_to(root_path)
      flash[:alert].should eql("The project you were looking for could not be found.")
    end
    
    
  end

end
