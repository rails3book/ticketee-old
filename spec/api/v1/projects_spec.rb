require "spec_helper"
require "api/helper"

describe "/api/v1/projects", :type => :api do
  
  let(:user) { create_user! }
  let(:token) { user.authentication_token }
  
  before do
    project = Factory(:project, :name => "Inspector")
    user.permissions.create!(:action => "read", :object => project)
    
    Factory(:project)
  end


  it "projects viewable by this user" do
    req = request!('/api/v1/projects.json')
    req.last[0].should eql(Project.readable_by(user).to_json)
  end
end