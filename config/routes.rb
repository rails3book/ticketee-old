Ticketee::Application.routes.draw do |map|
  root :to => "projects#index"
  resources :projects do
    resources :tickets
  end
end

