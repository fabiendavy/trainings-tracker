Rails.application.routes.draw do
  devise_for :users

  # root to: 'trainings#index'
  root to: redirect('/dashboard')
  get '/dashboard', to: "trainings#dashboard"
  
  resources :trainings, only: [:index, :create, :destroy]
end
