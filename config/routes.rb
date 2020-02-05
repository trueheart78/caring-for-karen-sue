Rails.application.routes.draw do
  resources :donations, only: [:index]
  namespace :donations do
    resources :registrations, only: [:new, :create]
    resources :hole_sponsors, only: [:new, :create]
    resources :lunches, only: [:new, :create]
    resources :donations, only: [:new, :create]
  end
  get 'donations/hole_sponsors', to: 'donations/hole_sponsors#new'
  get 'donations/registrations', to: 'donations/registrations#new'
  get 'donations/lunches', to: 'donations/lunches#new'
  get 'donations/donations', to: 'donations/donations#new'
  get 'about', to: 'about#index'
  get 'sponsors', to: 'sponsors#index'
  get 'robots.:format', to: 'robots#index'

  root 'welcome#index'
end
