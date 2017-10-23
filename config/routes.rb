Rails.application.routes.draw do

  get '/messages/inbox/:id', to: 'messages#show', as: :show
  get '/messages/entmessages/:id', to: 'messages#show2', as: :show2
  get '/messages/sentmessages', to: 'messages#sentmessage', as: :sentmessage
  get '/', to: 'messages#index'
  get '/users/friendlist', to: 'users#friendlist', as: :friendlist
  get '/users/requestlist', to: 'users#requestlist', as: :requestlist
  get '/sessions/login', to: 'sessions#new', as: :login
  post '/sessions/login', to: 'sessions#create', as: nil
  delete '/sessions/logout', to: 'sessions#destroy', as: :logout
  resources :messages, only: [:index,:new, :create]
  resources :users, only: [:index, :show, :new, :create]
  post '/users/addfriend', to: 'users#addfriend'
  post '/users/acceptfriend', to: 'users#acceptfriend'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
