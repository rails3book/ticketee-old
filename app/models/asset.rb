class Asset < ActiveRecord::Base
  belongs_to :ticket
  delegate :project_id, :to => :ticket
  has_attached_file :asset, :path => ":rails_root/files/:id", :url => lambda { |asset| "/projects/#{asset.instance.project_id}/tickets/#{asset.instance.ticket_id}/assets/:id" unless asset.instance.new_record? }
end
