Ticketee::Application.routes.draw do |map|
  root :to => "projects#index"
  resources :projects
end

