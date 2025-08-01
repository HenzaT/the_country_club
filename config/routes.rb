Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
  resources :countries, only: %i[home show] do
    resources :wishlists, only: %i[new create edit update destroy]
    resources :favourites, only: %i[new create edit update]
  end
  resources :favourites, only: %i[destroy]
  resources :wishlists, only: %i[destroy]
  get '/dashboard', to: 'countries#dashboard'
  post 'countries/:id/suggest_claude', to: 'countries#suggest_claude', as: :suggest_claude_country
  post 'countries/:id/suggest_season', to: 'countries#suggest_season', as: :suggest_season_country
  resources :continents, only: [:show]
  resources :regions, only: [:show]

  # Defines the root path route ("/")
  root 'countries#home'
end
