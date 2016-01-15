Rails.application.routes.draw do
  get 'about', to: 'about#index'

  root 'welcome#index'
end
