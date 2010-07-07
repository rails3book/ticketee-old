Ticketee::Application.routes.draw do |map|
  devise_for :users

  root :to => "projects#index"
  resources :projects do
    resources :tickets
  end

  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
    end
  end
end

