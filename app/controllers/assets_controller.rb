class AssetsController < ApplicationController
  def new
    @asset = Asset.new
    render :layout => false
  end

end
