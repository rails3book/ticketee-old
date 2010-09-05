require 'spec_helper'

describe CommentsController do

  let(:user) { create_user! }
  let(:project) { Project.create!(:name => "Ticketee") }
  let(:ticket) do 
    project.tickets.create!(:title => "Blocking comment creation", 
                           :description => "Naughty users")
  end

  it "doesn't allow comments to be created by users who are not permitted" do
    sign_in(:user, user)
    post :create, { :ticket_id => ticket.id, 
                    :comment => { 
                      :text => "This is a comment."
                    }
                   }
    response.should redirect_to([project, ticket])
    flash[:alert].should eql("You are not allowed to leave comments on this project.")
  end
end