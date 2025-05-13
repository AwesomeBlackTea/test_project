Rails.application.routes.draw do
  # Need to add authenticate_admin! when I config cancancan for admin
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users

  root 'posts#index'

  resources :posts
  get 'profile', to: 'users#show', as: 'profile'
end
