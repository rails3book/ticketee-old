class Comment < ActiveRecord::Base
  after_create :set_ticket_state
  
  belongs_to :ticket
  belongs_to :user
  belongs_to :state
  
  validates_presence_of :text
  
  private
  
    def set_ticket_state
      self.ticket.state = self.state
      self.ticket.save!
    end
end
