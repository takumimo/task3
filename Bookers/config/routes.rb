Rails.application.routes.draw do
  
  
  
  devise_for :users, controllers:{
  	sessions: 'devise/sessions',
  	registrations: 'devise/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  get "home/about" => "homes#about"
  root to: "homes#top"
  resources :users, only: [:index, :show, :edit, :update]
  
end
