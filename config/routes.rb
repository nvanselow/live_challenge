Rails.application.routes.draw do
  devise_for :users

  root 'homepage#index'

  namespace :api do
    namespace :v1 do
      resource :markdown, only: [:create], controller: 'markdown'
    end
  end

  resources :questions
  resources :answer_questions, only: [:show]
  resources :answers, only: [:create]
end
