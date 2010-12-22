class AccountsController < ApplicationController
  before_filter :authenticate_user!, :only => [:index]
  
  def index
    @accounts = current_user.accounts.includes(:projects)
  end
  
  def new
    @account = Account.new
    @account.build_owner
  end
  
  def create
    @account = Account.new(params[:account])
    if @account.save
      @account.users << @account.owner
    else
      flash[:alert] = "Your account could not be created."
      render :action => "new"
    end
  end
end
