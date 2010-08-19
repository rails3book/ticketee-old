class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  has_many :assets
  # accepts_nested_attributes_for :assets, :reject_if => proc { |asset| asset["asset"].blank? } 

  validates :title, :presence => true
  validates :description, :presence => true, :length => { :minimum => 10 }
end
