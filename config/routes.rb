Rails.application.routes.draw do
  resources :players
  resources :games
  resources :cards
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', to: 'sessions#create'
  get '/me', to: 'users#show'
  delete '/logout', to: 'sessions#destroy'
  get '/draw', to: 'cards#draw'
  get '/draw2', to: 'cards#draw2'
  get '/start-go-fish', to: 'cards#start_go_fish'
end
