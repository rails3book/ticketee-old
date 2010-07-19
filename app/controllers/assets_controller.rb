class AssetsController < ApplicationController
  def new
    @asset = Asset.new
    render :partial => "new", :layout => false
  end

end
