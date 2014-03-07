Viddo::Application.routes.draw do
  resources :users 
  resources :collections do
    resources :videos
  end

  
  resources :sessions, only: [:new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :collections

  root 'pages#home'

  match '/signup',      to: 'users#new',            via: 'get'
  match '/signin',      to: 'sessions#new',         via: 'get'
  match '/signout',     to: 'sessions#destroy',     via: 'delete'
  match '/about',       to: 'pages#about',          via: 'get'
  match '/contact',     to: 'pages#contact',        via: 'get'
  match '/join',        to: 'pages#join',           via: 'get'
  match '/collections', to: 'collections#index',    via: 'get'
  

  match '/discover', to: 'pages#player', via: 'get'


end
