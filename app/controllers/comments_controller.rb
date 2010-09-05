class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_ticket
  before_filter :authorize_create!

  def create
    @comment = @ticket.comments.build(params[:comment].merge(:user => current_user))
    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to [@ticket.project, @ticket]
    else
      flash[:alert] = "Comment has not been created."
      render :template => "tickets/show"
    end
  end

  private

    def find_ticket
      @ticket = Ticket.find(params[:ticket_id])
    end
    
    def authorize_create!
      if !current_user.admin? && cannot?(:"create comments", @ticket.project)
        flash[:alert] = "You are not allowed to leave comments on this project."
        redirect_to [@ticket.project, @ticket]
      end
    end
end