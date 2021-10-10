Rails.application.routes.draw do
  root :to => 'start#index'
  resources :users, only: %i[new create]
  resources :boards do
    resources :comments, only: %i[create edit destroy], shallow: true
    collection do
      get 'likes'
    end
  end
  resources :likes, only: %i[create destroy]
  resources :start, only: %i[index]

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => 'user_sessions#create'
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
