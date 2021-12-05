require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :companies
  resources :positions do
    resources :applicants, only: [:index]
  end

  resources :applicants, only: [:index, :new, :create]
  devise_for :users
  root "home#index"

  get "/vaga/:slug", action: :public_position, controller: :positions, as: :public_position
end
