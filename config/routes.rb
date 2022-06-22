Rails.application.routes.draw do
  resources :players
  resources :games
  resources :cards
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'
  get '/draw', to: 'cards#draw'
  get '/draw2', to: 'cards#draw2'
  post '/gofish/findgame', to: 'games#find_gofish'
  get '/gofish/refresh/:game_id', to: 'games#refresh_gofish'
  post '/gofish/ask', to: 'games#ask_gofish'
end
