class Project < ActiveRecord::Base
  belongs_to :account
  
  has_many :tickets
  has_many :permissions, :as => :object

  validates :name, :presence => true

  scope :readable_by, lambda { |user|
    joins(:permissions).where(:permissions => { :action => "view",
        :user_id => user.id })
  }
end

