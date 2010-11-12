require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Receiver do

  it "parses a reply from a comment update into a comment" do
    comment = Factory(:comment)
    ticket = comment.ticket
    
    comment_email = ActionMailer::Base.deliveries.last

    mail = Mail.new(:from => "user@ticketee.com",
                    :subject => "Re: #{comment_email.subject}",
                    :body => %Q{This is a brand new comment
                        #{comment_email.body}
                   },
                    :to => comment_email.from)

    p mail.body.to_s
    lambda { Receiver.parse(mail) }.should(
      change(ticket.comments, :count).by(1)
    )
    
  end
end