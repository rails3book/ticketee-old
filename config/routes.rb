Ticketee::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :projects do
        resources :tickets
      end
    end

    namespace :v2 do
      resources :projects
    end

    namespace :v3 do
      namespace :json do
        mount Api::V3::JSON::Tickets, :at => "projects/:project_id/tickets"
      end
    end

  end

  devise_for :users, :controllers => { 
    :omniauth_callbacks => "users/omniauth_callbacks" 
  }

  root :to => "projects#index"

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

