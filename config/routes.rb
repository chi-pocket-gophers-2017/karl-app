Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:show]
  resources :mentors, controller: 'users', only: [:new], action: "new_mentor"
  resources :mentors, controller: 'users', only: [:create], action: "create_mentor"
  resources :students, controller: 'users', only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :requests, only: [:new, :create, :patch, :destroy]
end
