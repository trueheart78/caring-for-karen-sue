Rails.application.routes.draw do
  resources :donations, only: [:index]
  namespace :donations do
    resources :registrations, only: [:new, :create]
    resources :hole_sponsors, only: [:new, :create]
    resources :lunches, only: [:new, :create]
    resources :donations, only: [:new, :create]
  end
  get 'about', to: 'about#index'
  get 'sponsors', to: 'sponsors#index'
  get 'robots.:format', to: 'robots#index'

  root 'welcome#index'
end
