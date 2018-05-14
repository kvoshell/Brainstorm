Rails.application.routes.draw do

  devise_for :users
  resources :questions do
    resources :answers
  end

  resources :starred_questions, only: [:index, :create, :destroy]
  resources :answers, only: :index

  resources :developments
  resources :designs
  resources :account_managements
  resources :others

  root 'welcome#index'
end
