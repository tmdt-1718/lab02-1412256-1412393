Rails.application.routes.draw do
  resources :chatrooms
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "chatrooms#index"
end