class CommentObserver < ActiveRecord::Observer
  def after_create(comment)
    Notifier.comment_updated(comment).deliver
  end
end
