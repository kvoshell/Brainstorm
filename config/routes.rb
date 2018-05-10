Rails.application.routes.draw do
  
  devise_for :users
  resources :questions do
    resources :answers
  end

  get 'account_managements/index'

  get 'developments/index'

  get 'designs/index'

  get 'welcome/index'

  root 'welcome#index'
end
