class Users::OmniauthCallbacksController < ApplicationController
  
  def self.provides(*providers)
    providers.each do |provider|
      class_eval %Q{
        def #{provider}
          @user = User.find_or_create_for_#{provider}(env["omniauth.auth"])
          flash[:notice] = "Signed in with #{provider.to_s.titleize} successfully."
          sign_in_and_redirect @user, :event => :authentication
        end
      }, __FILE__, __LINE__
    end
  end
  
  provides :twitter, :github
end