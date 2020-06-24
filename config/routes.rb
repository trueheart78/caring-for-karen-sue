Rails.application.routes.draw do
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
  post 'hook', to: 'successes#hook'
  get 'successes/index', to: 'successes#index'
  get 'successes', to: 'successes#index'
  get 'cancellations/index', to: 'cancellations#index'
  get 'cancellations', to: 'cancellations#index'
  resources :donations, only: [:index]
  get 'about', to: 'about#index'
  get 'sponsors', to: 'sponsors#index'
  get 'robots.:format', to: 'robots#index'

  root 'welcome#index'
end
