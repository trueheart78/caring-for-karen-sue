Rails.application.routes.draw do
  get 'sponsors/index'
  get 'about', to: 'about#index'
  get 'sponsors', to: 'sponsors#index'
  get 'robots.:format', to: 'robots#index'

  root 'welcome#index'
end
