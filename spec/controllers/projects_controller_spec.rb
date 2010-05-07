require 'spec_helper'

describe ProjectsController do
  it "displays an error message when asked for a missing project" do
    get :show, :id => "not-here"
    response.should redirect_to(projects_path)
    flash[:error].should eql("The project you were looking for could not be found.")
  end
end
