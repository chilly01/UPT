Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/signup', to: 'users#new'
  resources :venues
  resources :tours
  resources :games do
    get "clone"
  end
  resources :users do
  end
  root 'games#index'
end
