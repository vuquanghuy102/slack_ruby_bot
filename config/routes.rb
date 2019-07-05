Rails.application.routes.draw do
  namespace :admin do
    resource :profile, only: [:show, :update]
    resources :users
    resources :work_spaces
    resources :questions
    resources :answers
  end

  namespace :leader do
    resource :profile, only: [:show, :update]
    resources :work_spaces
    resources :questions
    resources :answers
  end

  root to: "home#index"
  devise_for :users
  post 'slack/button'
end
