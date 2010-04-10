class User < ActiveRecord::Base
  has_many :tickets
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end
end
