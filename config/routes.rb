Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => :registrations }

  resources :questions do
    resources :answers
  end

  resources :saved_questions, only: [:index, :create, :destroy]
  resources :answers, only: :index

  resources :developments
  resources :designs
  resources :project_managements
  resources :others
  resources :sales

  root 'developments#index'
end
