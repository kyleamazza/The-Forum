Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  get '/index' => 'static_pages#index'
  get '/posts' => 'posts#index'
  post '/posts/new' => 'posts#create'
  post 'login' => 'users#login'
  post 'clear' => 'static_pages#clear'
  get 'home' => 'static_pages#home'

end
