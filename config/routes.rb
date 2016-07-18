Rails.application.routes.draw do
  devise_for :users

  root 'homepage#index'

  namespace :api do
    namespace :v1 do
      resource :markdown, only: [:create], controller: 'markdown'
      resource :replit, only: [:show], controller: 'replit'
    end
  end

  resources :questions do
    resources :answers, only: [:create, :update]
  end
  resources :answer_questions, only: [:show]
end
