require 'spec_helper'

describe ProjectsController do
  before do
    @warden = OpenStruct.new

    request.env['warden'] = @warden
    @user = User.create!(:login => "user", :password => "ticketee", :password_confirmation => "ticketee", :email => "user@ticketee.com")

  end

  it "displays an error message when asked for a missing project" do
    get :show, :id => "not-here"
    response.should redirect_to(projects_path)
    flash[:alert].should eql("The project you were looking for could not be found.")
  end

  it "standard users cannot access the new action" do
    @warden.should_receive(:authenticate!).with(:scope => :user)
    controller.stub!(:current_user).and_return(@user)
    get :new
    response.should redirect_to(root_path)
    flash[:alert].should eql("You must be an admin to do that.")
  end
end
