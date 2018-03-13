Rails.application.routes.draw do
  get 'sessions/new'

  get 'welcome/index'

  root 'welcome#index'

  resources :units
  resources :sessions
  resources :quiz_submission, only: :create

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
