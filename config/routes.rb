Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  resources :top, only: [:index]
  resources :weights, only: [:index, :new, :create, :destroy] #(体重記録のページ）
  resources :users, only: [:show]
end