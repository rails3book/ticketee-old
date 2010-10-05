class TicketsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_project
  before_filter :find_ticket, :only => [:show, :edit, :update, :destroy]
  before_filter :authorize_create!, :only => [:new, :create]
  before_filter :authorize_update!, :only => [:edit, :update]
  before_filter :authorize_delete!, :only => [:destroy]

  def show
    @comment = @ticket.comments.build
    @states = State.all
  end

  def new
    @ticket = @project.tickets.build
    @ticket.assets.build
  end

  def create
    @ticket = @project.tickets.build(params[:ticket].merge!(:user => current_user))
    if @ticket.save
      @ticket.tag!(params[:tags]) if can?(:tag, @project)
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been created."
      render :action => "new"
    end
  end

  def edit

  end

  def update
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = "Ticket has been updated."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Ticket has been deleted."
    redirect_to @project
  end
  
  def search
    @tickets = @project.tickets.search(params[:search])
    render "projects/show"
  end

  private

    def find_ticket
      @ticket = @project.tickets.find(params[:id])
    end

    def authorize_create!
      if !current_user.admin? && cannot?(:"create tickets", @project)
        flash[:alert] = "You are not allowed to create tickets on this project."
        redirect_to @project
      end
    end

    def authorize_update!
      if !current_user.admin? && cannot?(:"edit tickets", @project)
        flash[:alert] = "You are not allowed to edit tickets on this project."
        redirect_to @project
      end
    end

    def authorize_delete!
      if !current_user.admin? && cannot?(:"delete tickets", @project)
        flash[:alert] = "You are not allowed to delete tickets from this project."
        redirect_to @project
      end
    end
end
