class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tickets
  has_many :permissions

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end
end
