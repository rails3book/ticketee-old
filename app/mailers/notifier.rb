class Notifier < ActionMailer::Base  
  def comment_updated(comment)
    @comment = comment
    users = comment.ticket.watchers - [comment.user]
    recipients users.map(&:email)
    subject "[ticketee] #{comment.ticket.project.name} - #{comment.ticket.title}"
    from "Ticketee <ticketee+#{comment.project.id}+#{comment.ticket_id}@gmail.com>"
  end
end
