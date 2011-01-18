module ApiHelper
  def get!(path='/api/v1', params={})
    request!(path, params)
  end

  def post!(path='/api/v1', params={})
    options = { "REQUEST_METHOD" => "POST" }
    request!(path, params, options)
  end

  private

  def request!(path='/api/v1', params={}, options={})
     params = { :token => token }.merge!(params)
     params = Rack::Utils.build_nested_query(params)
     request = Rack::MockRequest.env_for(path + "?#{params}")
     request.merge!(options)
     @status, @headers, @response = Rails.application.call(request)
  end
end

RSpec.configure do |c|
  c.include ApiHelper, :type => :api
end