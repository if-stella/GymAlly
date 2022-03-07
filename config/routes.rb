Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index', as: :users
  resources :users, only: %i[show edit update]
  delete "/friendships/:id", to: "friendships#destroy", as: :delete_friendship
  resources :meetups, only: %i[index]
  resources :friendships, only: %i[index create update] do
    resources :meetups, only: %i[new create]
    delete "meetup/:id", to: "meetups#destroy", as: :delete_meetup
    post "meetup/:id", to: "meetups#update", as: :update_meetup
  end
  post "/chatroom", to: "chatrooms#create", as: :chatroom_create
  resources :chatrooms, only: %i[index show] do
    resources :messages, only: :create
  end
  resources :gyms, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
