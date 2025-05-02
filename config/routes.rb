Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  resources :posts
  get 'profile', to: 'users#show', as: 'profile'
end
