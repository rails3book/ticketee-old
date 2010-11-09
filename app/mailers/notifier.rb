class Notifier < ActionMailer::Base
  default :from => "from@example.com"
  
  def comment_updated(comment)
    @comment = comment
    users = comment.ticket.watchers - [comment.user]
    recipients users.map(&:email)
  end
end
