Rails.application.routes.draw do
  resources :users

  # User routes
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit', as: 'user_edit'
  patch '/users/:id/edit', to: 'users#update', as: 'user_update'

  # Static pages routes
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/help', to: 'static_pages#help'
end
