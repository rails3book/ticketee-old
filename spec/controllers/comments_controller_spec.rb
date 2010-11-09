require 'spec_helper'

describe CommentsController do
  
  let(:project) { Factory(:project) }
  let(:ticket) { Factory(:ticket, :project => project) }
  let(:state) { State.create!(:name => "New") }
  let(:user) { create_user! }
  
  context "a user without permission to set state" do
    before do
      sign_in(:user, user)
    end
    
    it "cannot transition a state by passing through state_id" do
      post :create, { :tags => "", :comment => { :text => "Hacked!",
                                  :state_id => state.id },
                      :ticket_id => ticket.id }
      ticket.reload 
      ticket.state.should eql(nil)
    end
    
    it "cannot tag a ticket without permission" do
      post :create, { :tags => "one two", :comment => { :text => "Tag!" },
                      :ticket_id => ticket.id }
      ticket.reload
      ticket.tags.should be_empty
    end
  end
end