Ticketee::Application.routes.draw do |map|
  devise_for :users

  root :to => "projects#index"
  resources :projects do
    resources :tickets
  end
end

