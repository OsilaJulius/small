Rails.application.routes.draw do
  resources :users

  get 'users/new'

  get 'users/show'

  get 'users/edit'

  # Static pages routes
  root 'static_pages#home'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
  get 'help', to: 'static_pages#help'
end
