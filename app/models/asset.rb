class Asset < ActiveRecord::Base
  has_attached_file :asset
  
  belongs_to :ticket
end
