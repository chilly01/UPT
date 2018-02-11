Rails.application.routes.draw do
  resources :venues
  resources :tours
  resources :games
  resources :users
  root 'games#index'
end
