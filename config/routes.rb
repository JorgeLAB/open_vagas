Rails.application.routes.draw do
  resources :companies
  resources :positions
  resources :applicants, only: [:index, :new, :create]
  devise_for :users
  root "home#index"
end
