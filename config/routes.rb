Rails.application.routes.draw do
  
  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  post 'cerlogoff', to: 'sessions#cerlogoff'

  post 'cerlogin', to: 'sessions#cerlogin'

  post 'post_create', to: 'posts#create'

  get '/signup', to: 'users#new'

  post 'content_create', to: 'contents#create'

  root 'static_pages#home'




  resources :users

  resources :posts,          only: [:create, :destroy, :show]

  resources :contents,        only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
