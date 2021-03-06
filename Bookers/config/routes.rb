Rails.application.routes.draw do
  get 'search/search'
  devise_for :users, controllers:{
  	sessions: 'devise/sessions',
  	registrations: 'devise/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
  get "home/about" => "homes#about"
  root to: "homes#top"
  resources :users, only: [:index, :show, :edit, :update]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  get "search" => "search#search"
end
