module OauthHelper
  def auth_providers(*names)
    names.each do |name|
      concat(link_to(image_tag("icons/#{name}.png"),
      "/auth/#{name}",
      :id => "sign_in_with_#{name}"))
    end
    nil
  end
end