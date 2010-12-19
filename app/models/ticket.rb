class Ticket < ActiveRecord::Base
  # searcher do
  #   label :tag, :from => :tags, :field => "name"
  #   label :state, :from => :state, :field => "name"
  # end
  
  belongs_to :project
  belongs_to :user
  belongs_to :state
  
  has_many :assets
  has_many :comments

  has_and_belongs_to_many :tags
  has_and_belongs_to_many :watchers, :join_table => "ticket_watchers", 
                                     :class_name => "User"
  
  accepts_nested_attributes_for :assets, :reject_if => proc { |asset| asset["asset"].blank? } 

  validates :title, :presence => true
  validates :description, :presence => true, :length => { :minimum => 10 }
  
  after_create :creator_watches_me

  def tag!(tags)
    tags = tags.split(" ").map do |tag| 
      Tag.find_or_create_by_name(tag)
    end
    
    self.tags << tags
  end
  
  private
  
  def creator_watches_me
    self.watchers << user
    self.save
  end

end
