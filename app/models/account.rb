class Account < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  accepts_nested_attributes_for :owner
  
  has_many :projects
  
  has_many :account_users
  has_many :users, :through => :account_users
  
  validates :name, :path, :presence => true
  
  RESERVED_PATHS = %w(admin signup)
  validates_exclusion_of :path,
                         :in => RESERVED_PATHS,
                         :message => "is not allowed, please choose another."
  
  def admins
    users.joins(:account_users).
    where("account_users.admin = ?", true)
  end
  
  def projects_for(user)
    if admins.include?(user)
      projects
    else
      projects.readable_by(user)
    end
  end
  
end