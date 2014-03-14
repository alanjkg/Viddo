Viddo::Application.routes.draw do
  # match '/add_video_to_collection', to: 'collections_videos#create', via: 'post'
  resources :videos do
    resources :comments
  end

  resources :sessions, only: [:new, :create, :destroy]

  resources :collections do
    member do
      patch :user_follow
      patch :stop_following
    end

    collection do
      patch :add_video
    end
  end

  resources :users

  root 'pages#home'

  get '/signup' => 'users#new', as: 'signup'
  get '/signin' => 'sessions#new', as: 'signin'
  delete '/signout' => 'sessions#destroy'
  get '/about' => 'pages#about', as: 'about'
  get '/contact' => 'pages#contact', as: 'contact'
  get '/join' => 'pages#join', as: 'join'

end
