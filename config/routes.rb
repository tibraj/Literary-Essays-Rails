Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get '/' => 'sessions#welcome'
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/signup' => 'users#new'
get '/auth/google_oauth2/callback' => 'sessions#create_by_omniauth'
delete '/logout' => 'sessions#destroy'

resources :essays do
  resources :books, only: [:new, :index]
end 
resources :users
resources :books
resources :responses
end
