Rails.application.routes.draw do
  devise_for :users
  resources :messages, only: [:index, :show, :new, :create, :update, :destroy]
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
