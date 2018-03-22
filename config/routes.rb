Rails.application.routes.draw do
  resources :words
  root 'words#index'
  get 'signin', to: 'user#signin'
  post 'signin', to: 'user#login'
  get 'register', to: 'user#new'
  post 'register', to: 'user#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
