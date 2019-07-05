Rails.application.routes.draw do
  namespace :admin do
    resource :profile, only: [:show, :update]
    resources :users
    resources :work_spaces
    resources :questions
    resources :answers
  end
  root to: "admin/work_spaces#index"
  devise_for :users
  post 'slack/button'
end
