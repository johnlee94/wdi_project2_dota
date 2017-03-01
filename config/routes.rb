Rails.application.routes.draw do
  #for nested?
  # resources :users do
  #   resources :posts
  # end
  resources :posts

  # sign up page with form:
  get 'users/posts' => 'users#user_posts', as: :user
  get 'users/new' => 'users#new', as: :new_user
  get 'users/:id' => 'users#show', as: :profile

  # create (post) action for when sign up form is submitted:
  post 'users/' => 'users#create'
  #posts_paths
  # get 'users/:user_id/posts' => 'posts#index', as: :posts
  # get 'users/:user_id/posts/new' => 'posts#new', as: :new_post
  # get 'users/:user_id/posts/:id' => 'posts#show', as: :post
  # get 'users/:user_id/posts/:id/edit' => 'posts#edit', as: :edit_post
  # post 'users/:user_id/posts' => 'posts#create'
  # patch 'users/:user_id/posts/:id' => 'posts#update'
  # delete 'users/:user_id/posts/:id' => 'posts#destroy'

  get 'pages/secret'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Add a root route if you don't have one...
  # We can use users#new for now, or replace this with the controller and action you want to be the site root:
  root to: 'users#welcome'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


end
