Rails.application.routes.draw do
  devise_for :users

  # root to: 'trainings#index'
  root to: redirect('/trainings')
  resources :trainings, only: [:index, :create]
end
