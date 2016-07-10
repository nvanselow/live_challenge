Rails.application.routes.draw do
  devise_for :users
  root 'homepage#index'

  resources :questions, only: [:show, :new, :create]
end
