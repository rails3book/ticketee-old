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
        Factory(:ticket, :project => project, :user => @user)
      end
    end
    
    it "gets the first page" do
      get "/api/v1/projects/#{project.id}/tickets.json", :token => token
      last_response.body.should eql(project.tickets.page(1).per(50).to_json)
    end
    
    it "gets the second page" do
      get "/api/v1/projects/#{project.id}/tickets.json", :page => 2, 
                                                    :token => token
      last_response.body.should eql(project.tickets.page(2).per(50).to_json)
    end
  end
end