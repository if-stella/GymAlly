Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/users/filter", to: "users#filter", as: :filter
  resources :users, only: %i[index show edit update]
  resources :friendships, only: %i[create update]
  resources :chatrooms, only: %i[index show] do
    resources :messages, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
