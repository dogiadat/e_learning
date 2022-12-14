Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:create, :index, :edit, :update, :show]
  resources :categories, only: [:index, :show]
  namespace :admin do
    root "users#index"
    resources :users, only: [:index, :destroy, :show]
    resources :categories do
      resources :words
    end
  end
end
