Rails.application.routes.draw do
  root :to => 'users#index'
  resources :users
  resources :boards do
    resources :comments, only: %i[create edit destroy], shallow: true
    collection do
      get 'likes'
    end
  end
  resources :likes, only: %i[create destroy]

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => 'user_sessions#create'
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
