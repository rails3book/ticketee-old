require "spec_helper"

describe "/api/v1/projects", :type => :api do
  let(:user) do 
    user = create_user!
    user.update_attribute(:admin, true)
    user
  end
  
  let(:token) { user.authentication_token }

  context "projects viewable by this user" do
    let(:project) { Factory(:project, :name => "Inspector") }

    before do
      user.permissions.create!(:action => "view", :object => project)
      Factory(:project)
    end

    context "index" do
      let(:url) { "/api/v1/projects" }
      it "JSON" do
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
    
    context "show" do
      let(:url) { "/api/v1/projects/#{project.id}"}
      
      before do
        Factory(:ticket, :title => "A ticket, nothing more.",
                :project => project)
      end
      
      it "JSON" do
        get "#{url}.json", :token => token
        last_response.body.should eql(project.to_json(:methods => "last_ticket"))
        last_response.status.should eql(200)
        
        project_response = JSON.parse(last_response.body)["project"]
        
        ticket_title = project_response["last_ticket"]["ticket"]["title"]
        ticket_title.should_not be_blank
      end
    end
  end
  
  context "creating a project" do
    let(:url) { "/api/v1/projects" }
    
    it "sucessful JSON" do
      post "#{url}.json", :token => token,
                          :project => {
                            :name => "Ticketee"
                          }
      last_response.status.should eql(201)
      last_response.body.should eql(Project.find_by_name("Ticketee").to_json)
    end
  end
end