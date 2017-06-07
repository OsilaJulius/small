Rails.application.routes.draw do
  #get 'articles/show'

  resources :users
  resources :articles, only: [:create, :show]
  resources :comments, only: [:edit, :create]
  resources :relationships, only: [:create, :destroy]

  # Static pages routes
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/help', to: 'static_pages#help'

  # User routes
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/users/:id/edit', to: 'users#edit', as: 'user_edit'
  patch '/users/:id/edit', to: 'users#update', as: 'user_update'

  # Session routes
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  # Comments routes
  get 'articles/:id/comments', to: 'comments#edit'
  post 'articles/:id/comments', to: 'comments#create', as: 'comment_create'
end
