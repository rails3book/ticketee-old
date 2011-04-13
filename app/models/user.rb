class User < ActiveRecord::Base
  extend OmniauthCallbacks
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable
         
  before_save :ensure_authentication_token

  has_many :tickets
  has_many :permissions

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation

  def self.reset_request_count!
    update_all("request_count = 0", "request_count > 0")
  end
  
  def display_name
    if twitter_id
      "#{twitter_display_name} (@#{twitter_screen_name})"
    elsif github_id
      "#{github_display_name} (#{github_user_name})"
    else
      email
    end
  end

  def to_s
    "#{display_name} (#{admin? ? "Admin" : "User"})"
  end

end
