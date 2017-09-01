Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  root 'welcome#index'
  get '/queue', to: "users#show"
  resources :users, only: [:show]
  resources :mentors, controller: 'users', only: [:new], action: "new_mentor"
  resources :mentors, controller: 'users', only: [:create], action: "create_mentor"
  resources :students, controller: 'users', only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :requests, only: [:new, :create, :patch, :destroy]
end
