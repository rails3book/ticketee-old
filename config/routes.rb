Ticketee::Application.routes.draw do

  devise_for :users

  root :to => "projects#index"
  get 'signup', :to => "accounts#new"
  
  resources :projects do
    resources :tickets do
      collection do
        get :search
      end
      
      member do
        post :watch
      end
    end
  end
  
  resources :tickets do
    resources :comments
    resources :tags do
      member do
        delete :remove
      end
    end
  end
  
  resources :assets

  namespace :admin do
    root :to => "base#index"
    resources :users do
      resources :permissions
    end
    resources :states do
      member do
        get :make_default
      end
    end
  end
  
  match '/admin/users/:user_id/permissions', :to => 'admin/permissions#update', :as => :update_user_permissions
end

