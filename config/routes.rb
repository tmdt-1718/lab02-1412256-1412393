Rails.application.routes.draw do

  get '/users/friendlist', to: 'users#friendlist', as: :friendlist
  get '/users/requestlist', to: 'users#requestlist', as: :requestlist
  get '/sessions/login', to: 'sessions#new', as: :login
  post '/sessions/login', to: 'sessions#create', as: nil
  delete '/sessions/logout', to: 'sessions#destroy', as: :logout
  resources :messages, only: [:index, :show, :new, :create, :update, :destroy]
  resources :users, only: [:index, :show, :new, :create]
  post '/users/addfriend', to: 'users#addfriend'
  post '/users/acceptfriend', to: 'users#acceptfriend'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
