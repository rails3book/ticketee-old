module SeedHelpers
  def create_user!(attributes={})
    default_attributes = { :email => "user@ticketee.com",
                           :password => "password",
                           :password_confirmation => "password" }
    user = User.create!(default_attributes.merge(attributes))
    user.confirm!
    user
  end
end

RSpec.configure do |config|
  config.include SeedHelpers
end