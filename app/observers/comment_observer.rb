class CommentObserver < ActiveRecord::Observer
  def after_create(comment)
    p "LOL"
  end
end
