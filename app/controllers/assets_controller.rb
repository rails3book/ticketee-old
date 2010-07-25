class AssetsController < ApplicationController
  before_filter :authenticate_user!, :only => :show
  before_filter :find_project, :only => :show
  
  def new
    @ticket = Ticket.new
    @ticket.assets.build
    render :partial => "new", :layout => false
  end
  
  def show
    send_file Rails.root + "files/#{params[:id]}"
  end

end
