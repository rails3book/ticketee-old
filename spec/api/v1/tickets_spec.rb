require 'spec_helper'
describe "/api/v1/tickets", :type => :api do
  let(:user) do 
    user = create_user!
    user.update_attribute(:admin, true)
    user
  end

  let(:token) { user.authentication_token }
  let(:project) { Factory(:project, :name => "Inspector") }
  
  context "index" do
    before do
      5.times do
        Factory(:ticket, :project => project)
      end
    end
    let(:url) { "/api/v1/projects/#{project.id}/tickets" }
  
    it "XML" do
      get "#{url}.xml", :token => token
      last_response.body.should eql(project.tickets.to_xml)
    end
  
    it "JSON" do
      get "#{url}.json", :token => token
      last_response.body.should eql(project.tickets.to_json)
    end
  end
  
  context "pagination" do
    before do
      100.times do
        Factory(:ticket, :project => project)
      end
    end
    
    it "gets the first page" do
      get "/api/v1/projects/#{project.id}/tickets?page=1"
      last_response.body.should eql(project.tickets.per(50).page(1).to_json)
    end
    
    it "gets the second page" do
      get "/api/v1/projects/#{project.id}/tickets?page=2"
      last_response.body.should eql(project.tickets.per(50).page(2).to_json)
    end
  end
end