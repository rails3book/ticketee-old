require "spec_helper"
require "api/helper"

describe "API errors", :type => :api do

  let(:token) { "" }

  it "making a request with no token" do
    get!("/api/v1/projects.json")
    @response.body.should eql({ :error => "Token is invalid." }.to_json)
  end

end