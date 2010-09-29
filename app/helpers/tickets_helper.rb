module TicketsHelper
  def state_for(comment)
    content_tag(:div, :class => "states") do
      if comment.previous_state != comment.state && comment.previous_state && comment.state
        "#{render comment.previous_state} &rarr; #{render comment.state}"
      end
    end
  end
end
