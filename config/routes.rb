Rails.application.routes.draw do

  root 'static_pages#home'
  get '/about', to: 'static_pages#about', as: 'about'
  # get '/search', to: 'movies#search'
  get '/title', to: 'movies#title'
  get '/genre', to: 'movies#genre'
  get '/actor', to: 'movies#actor'


  post '/', to: 'movies#search'
  post '/title', to: 'movies#search'
  post '/actor', to: 'movies#search'
  post '/genre', to: 'movies#search'

  resources :movies
end
