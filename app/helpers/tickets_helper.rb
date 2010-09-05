module TicketsHelper
  def state_for(comment)
    if comment.previous_state != comment.state
      "State: #{comment.previous_state} &#x2192; #{comment.state}".html_safe
    end
  end
end