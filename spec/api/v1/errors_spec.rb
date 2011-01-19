require "spec_helper"

describe "API errors", :type => :api do

  let(:token) { "" }

  it "making a request with no token" do
    get "/api/v1/projects.json", :token => token
    error = { :error => "Token is invalid." }
    last_response.body.should eql(error.to_json)
  end
  
  it "standard users cannot create projects" do
    user = Factory(:user)
      post "/api/v1/projects.json", :token => user.authentication_token,
                        :project => {
                          :name => "Ticketee"
                        }
    error = { :error => "You must be an admin to do that." }
    last_response.body.should eql(error.to_json)
    Project.find_by_name("Ticketee").should be_nil
  end

end