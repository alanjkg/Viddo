Viddo::Application.routes.draw do
  # match '/add_video_to_collection', to: 'collections_videos#create', via: 'post'
  resources :collections
  resources :users

  resources :collections do 
    collection do
      patch :add_video
    end
  end

  get 'users/:id/collections/:id/user_follow' => 'collections#user_follow', as: 'user_follow'
  get 'users/:id/collections/:id/stop_following' => 'collections#stop_following', as: 'stop_following'

  resources :videos
  
  resources :sessions, only: [:new, :create, :destroy]
  
  root 'pages#home'

  match '/signup',      to: 'users#new',            via: 'get'
  match '/signin',      to: 'sessions#new',         via: 'get'
  match '/signout',     to: 'sessions#destroy',     via: 'delete'
  match '/about',       to: 'pages#about',          via: 'get'
  match '/contact',     to: 'pages#contact',        via: 'get'
  match '/join',        to: 'pages#join',           via: 'get'

end
