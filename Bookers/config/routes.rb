Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#index'
  resources :books, only: [:new, :create, :index, :show]
  get "about" => "non_logins#about"
  get "home" => "non_logins#home"
end
