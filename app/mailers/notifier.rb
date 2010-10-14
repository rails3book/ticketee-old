class Notifier < ActionMailer::Base
  default :from => "from@example.com"
  
  def comment_updated(comment)
    @comment = comment
    recipients comment.ticket.watchers.map(&:email)
  end
end
