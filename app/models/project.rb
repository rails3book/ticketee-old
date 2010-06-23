class Project < ActiveRecord::Base
  has_many :tickets
  has_many :permissions, :as => :object

  validates :name, :presence => true

  scope :readable_by, lambda { |user| joins(:permissions).where(:permissions => { :action => "read", :user_id => user.id })}

  def self.for(current_user)
    current_user.admin? ? Project : Project.readable_by(current_user)
  end
end

