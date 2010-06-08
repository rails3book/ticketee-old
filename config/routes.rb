Ticketee::Application.routes.draw do |map|
  devise_for :users

  root :to => "projects#index"
  resources :projects do
    resources :tickets
  end

  namespace :admin do
    resources :users
  end
end

