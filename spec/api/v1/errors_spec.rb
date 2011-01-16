require "spec_helper"
require "api/helper"

describe "API errors", :type => :api do

  let(:token) { "" }

  it "making a request with no token" do
    req = request!("/api/v1/projects")
    req.last[0].should eql({ :error => "Token is invalid." }.to_json)
  end

end