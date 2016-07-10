Rails.application.routes.draw do
  devise_for :users
  root 'homepage#index'

  resources :questions, only: [:index, :show, :new, :create]
end
