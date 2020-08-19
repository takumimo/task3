Rails.application.routes.draw do
  
  
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :books, only: [:new, :create, :index, :show]
  get "about" => "homes#about"
  get "top" => "homes#top"
  root to: "homes#top"
  resources :users, only: [:index, :show]
  resources :homes, only: [:new, :create, :index, :show]
  post 'submits' => 'users#create'
  get 'submits' => 'users#show'
end
