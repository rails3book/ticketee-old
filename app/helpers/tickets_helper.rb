module TicketsHelper
  def state_for(comment)
    content_tag(:div, :class => "states") do
      if comment.previous_state != comment.state && comment.previous_state && comment.state
        "#{render comment.previous_state} &#x2192; #{render comment.state}".html_safe
      end
    end
  end
end
