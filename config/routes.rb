Rails.application.routes.draw do
  resources :games
  resources :cards
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', to: 'sessions#create'
  get '/me', to: '#users#check_login'
  delete '/logout', to: 'sessions#destroy'
end
