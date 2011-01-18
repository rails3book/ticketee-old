require "spec_helper"
require "api/helper"

describe "/api/v1/projects", :type => :api do

  let(:user) { create_user! }
  let(:token) { user.authentication_token }


  context "projects viewable by this user" do

    before do
      project = Factory(:project, :name => "Inspector")
      user.permissions.create!(:action => "view", :object => project)

      Factory(:project)
    end

    let(:url) { "/api/v1/projects" }
    it "json" do
      get!("#{url}.json")
      @response.body.should eql(Project.readable_by(user).to_json)
      @status.should eql(200)
      projects = JSON.parse(@response.body)
      projects.any? { |p| p["project"]["name"] == "Inspector" }.should be_true
    end

    it "XML" do
      get!("#{url}.xml")
      @response.body.should eql(Project.readable_by(user).to_xml)
      @status = 200
      projects = Nokogiri::XML(@response.body)
      projects.css("project name").text.should eql("Inspector")
    end
  end
  
  context "creating a project" do
    before do
      user.permissions.create!(:action => "create_projects")
    end
    
    let(:url) { "/api/v1/projects" }
    
    it "sucessful JSON" do
      post!("#{url}.json", :project => {
                             :name => "Ticketee"})
      @status.should eql(201)
      @response.body.should eql(Project.find_by_name("Ticketee").to_json)
    end
  end
end