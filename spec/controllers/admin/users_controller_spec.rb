require 'spec_helper'

describe Admin::UsersController do
  describe "non-logged in users" do
    it "are not able to access the index action" do
      get 'index'
      response.should redirect_to(new_user_session_path)
      flash[:error].should eql("You must be logged in to do that.")
    end
  end
end
