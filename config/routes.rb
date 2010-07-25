Ticketee::Application.routes.draw do |map|

  devise_for :users

  root :to => "projects#index"
  resources :projects do
    resources :tickets do
      constraints :id => /[A-Za-z0-9\-\_\.]+/ do
        resources :assets, :only => :show
      end
    end
  end

  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
    end
  end
  
  resources :assets
  
  match '/admin/users/:user_id/permissions', :to => 'admin/permissions#update', :as => :update_user_permissions
end

