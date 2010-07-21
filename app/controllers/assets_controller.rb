class AssetsController < ApplicationController
  def new
    @ticket = Ticket.new
    @ticket.assets.build
    render :partial => "new", :layout => false
  end

end
