Ticketee::Application.routes.draw do

  devise_for :users

  root :to => "projects#index"
  
  resources :projects do
    resources :tickets
  end
  
  resources :assets

  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
    end
  end
  
  match '/admin/users/:user_id/permissions', :to => 'admin/permissions#update', :as => :update_user_permissions
end

