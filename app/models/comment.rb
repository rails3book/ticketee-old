class Comment < ActiveRecord::Base
  after_create :set_ticket_state
  after_create :creator_watches_ticket
  before_create :set_previous_state
  
  belongs_to :ticket
  belongs_to :user
  belongs_to :state
  belongs_to :previous_state, :class_name => "State"
  
  validates_presence_of :text
  
  delegate :project, :to => :ticket
  delegate :account, :to => :project
  
  private
  
    def set_ticket_state
      self.ticket.state = self.state
      self.ticket.save!
    end
    
    def set_previous_state
      self.previous_state = ticket.state
    end
    
    def creator_watches_ticket
      ticket.watchers << user
      ticket.save
    end
end
