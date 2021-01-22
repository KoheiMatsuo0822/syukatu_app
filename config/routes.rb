Rails.application.routes.draw do
  
  get 'sessions/new'
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/new_corp', to: 'corporates#new'
  post '/new_corp', to: 'corporates#create'
  resources :users
  resources :corporates
  
end
