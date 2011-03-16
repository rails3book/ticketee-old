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
      20.times do
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
end