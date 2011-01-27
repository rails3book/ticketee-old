require "spec_helper"

describe "/api/v2/projects", :type => :api do
  let(:user) do 
    user = create_user!
    user.update_attribute(:admin, true)
    user
  end
  
  let(:token) { user.authentication_token }
  let(:project) { Factory(:project, :name => "Inspector") }

  context "projects viewable by this user" do

    before do
      user.permissions.create!(:action => "view", :object => project)
      Factory(:project)
    end

    context "index" do
      let(:url) { "/api/v2/projects" }
      let(:options) { { :except => :name, :methods => :title } }
      
      it "JSON" do
        get "#{url}.json", :token => token
        
        body = Project.readable_by(user).to_json(options)
        
        last_response.body.should eql(body)
        last_response.status.should eql(200)
        
        projects = JSON.parse(last_response.body)
        projects.any? do |p|
          p["project"]["title"] == "Inspector"
        end.should be_true
        
        projects.all? do |p|
          p["project"]["name"].blank? 
        end.should be_true
      end

      it "XML" do
        get "#{url}.xml", :token => token
        
        body = Project.readable_by(user).to_xml(options)
        last_response.body.should eql(body)
        projects = Nokogiri::XML(last_response.body)
        projects.css("project title").text.should eql("Inspector")
        projects.css("project name").text.should eql("")
      end
    end
    
    context "show" do
      let(:url) { "/api/v2/projects/#{project.id}"}
      
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
    let(:url) { "/api/v2/projects" }
    
    it "sucessful JSON" do
      post "#{url}.json", :token => token,
                          :project => {
                            :name => "Ticketee"
                          }
      last_response.status.should eql(201)
      last_response.body.should eql(Project.find_by_name("Ticketee").to_json)
    end
  end
  
  context "updating a project" do
    let(:url) { "/api/v2/projects/#{project.id}" }
    it "successful JSON" do
      project.name.should eql("Inspector")
      put "#{url}.json", :token => token,
                          :project => { 
                            :name => "Not Inspector"
                          }
      last_response.status.should eql(200)
      
      project.reload
      project.name.should eql("Not Inspector")
    end
    
    it "unsuccessful JSON" do
      project.name.should eql("Inspector")
      put "#{url}.json", :token => token,
                          :project => { 
                            :name => ""
                          }
      last_response.status.should eql(422)
      
      project.reload
      project.name.should eql("Inspector")
      error = { :name => "can't be blank"}
      last_response.body.should eql(error.to_json)
    end
  end
  
  context "deleting a project" do
    let(:url) { "/api/v2/projects/#{project.id}" }
    it "JSON" do
      delete "#{url}.json", :token => token
      last_response.status.should eql(200)
    end
  end
end






































