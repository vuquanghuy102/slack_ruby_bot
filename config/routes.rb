Rails.application.routes.draw do
  namespace :admin do
    resource :profile, only: [:show, :update]
    resources :users
    resources :companys
    resources :questions
    resources :answers
  end
  byebug
  root to: "admin/companys#index"
  devise_for :users
  post 'slack/button'
end
