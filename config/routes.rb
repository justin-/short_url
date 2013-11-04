ShortUrl::Application.routes.draw do

  root to: 'static_pages#home'
  
  resources :users
  resources :links, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  match '/signin',  to: 'sessions#new',                      via: 'get'
  match '/auth/:provider/callback', to: 'sessions#create',   via: [:get, :post]
  #match '/auth/failure'
  match '/signout', to: 'sessions#destroy',                  via: 'delete'  
  
  match '/*shortcode', to: 'links#redirect',                 via: 'get'

end
