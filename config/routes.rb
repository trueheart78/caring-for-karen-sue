Rails.application.routes.draw do
  get 'donations', to: 'donations#index'
  post 'donations', to: 'donations#create'
  get 'about', to: 'about#index'
  get 'sponsors', to: 'sponsors#index'
  get 'robots.:format', to: 'robots#index'

  root 'welcome#index'
end
