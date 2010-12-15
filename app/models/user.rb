class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable and :timeoutable
  devise :database_authenticatable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tickets
  has_many :permissions
  has_many :account_users
  has_many :accounts, :through => :account_users

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end
end
