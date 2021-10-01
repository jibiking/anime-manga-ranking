Rails.application.routes.draw do
  root :to => 'users#index'
  resources :users
  resources :boards

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => 'user_sessions#create'
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
