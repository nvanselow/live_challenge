Rails.application.routes.draw do
  devise_for :users

  root 'homepage#index'

  resource :markdown, only: [:create], controller: 'markdown'
  resources :questions, only: [:index, :show, :new, :create]
end
