Rails.application.routes.draw do
  get    '/roles',   to: 'roles#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/logout',  to: 'sessions#destroy'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#new'
  resources :users
  resources :venues
  resources :tours
  resources :games do
    get "clone"
  end
  root 'games#index'
end
