require "spec_helper"

describe "/api/v1/projects", :type => :api do
  let(:user) do 
    user = create_user!
    user.update_attribute(:admin, true)
    user
  end
  
  let(:token) { user.authentication_token }

  context "projects viewable by this user" do

    before do
      project = Factory(:project, :name => "Inspector")
      user.permissions.create!(:action => "view", :object => project)

      Factory(:project)
    end

    let(:url) { "/api/v1/projects" }
    it "json" do
      get "#{url}.json", :token => token
      last_response.body.should eql(Project.readable_by(user).to_json)
      last_response.status.should eql(200)
      projects = JSON.parse(last_response.body)
      projects.any? { |p| p["project"]["name"] == "Inspector" }.should be_true
    end

    it "XML" do
      get "#{url}.xml", :token => token
      last_response.body.should eql(Project.readable_by(user).to_xml)
      projects = Nokogiri::XML(last_response.body)
      projects.css("project name").text.should eql("Inspector")
    end
  end
  
  context "creating a project" do
    before do
      user.permissions.create!(:action => "create_projects")
    end
    
    let(:url) { "/api/v1/projects" }
    
    it "sucessful JSON" do
      post "#{url}.json", :token => token,
                          :project => {
                            :name => "Ticketee"
                          }
      last_response.status.should eql(201)
      p last_response.headers
      last_response.body.should eql(Project.find_by_name("Ticketee").to_json)
    end
  end
end