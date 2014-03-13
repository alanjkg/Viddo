Viddo::Application.routes.draw do
  # match '/add_video_to_collection', to: 'collections_videos#create', via: 'post'
  resources :videos
  resources :sessions, only: [:new, :create, :destroy]

  resources :users do
    resources :collections do
      patch 'user_follow'
    end
  end

  resources :collections do
    collection do
      patch :add_video
    end
  end

  get 'users/:user_id/collections/:id/user_follow' => 'collections#user_follow', as: 'user_follow'
  get 'users/:user_id/collections/:id/stop_following' => 'collections#stop_following', as: 'stop_following'

  root 'pages#home'

  get '/signup' => 'users#new', as: 'signup'
  get '/signin' => 'sessions#new', as: 'signin'
  match '/signout' => 'sessions#destroy', :via=> :delete
  get '/about' => 'pages#about', as: 'about'
  get '/contact' => 'pages#contact', as: 'contact'
  get '/join' => 'pages#join', as: 'join'

end
