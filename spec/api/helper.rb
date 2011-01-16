module ApiHelper
  def request!(path='/api/v1')
    request = Rack::MockRequest.env_for(path + "?token=#{token}")
    Rails.application.call(request)
  end
end

RSpec.configure do |c|
  c.include ApiHelper, :type => :api
end