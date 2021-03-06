Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # root to: 'users#index', as: :users
  root to: 'pages#home'
  get "/users", to: "users#index", as: :users
  resources :users, only: %i[show edit update]
  delete "/friendships/:id", to: "friendships#destroy", as: :delete_friendship
  resources :meetups, only: %i[index]
  post "/friendships", to: "friendships#create", as: :create_friendship
  resources :friendships, only: %i[index update] do
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
