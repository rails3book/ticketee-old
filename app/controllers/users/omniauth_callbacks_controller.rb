class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.find_or_create_for_twitter(env["omniauth.auth"])
    flash[:notice] = "Signed in with Twitter successfully."
    sign_in_and_redirect @user, :event => :authentication
  end
  
  def github
    @user = User.find_or_create_for_github(env["omniauth.auth"])
    flash[:notice] = "Signed in with GitHub successfully."
    sign_in_and_redirect @user, :event => :authentication
  end
end