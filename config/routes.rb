Rails.application.routes.draw do

  root to: 'user#index'
  
  resources :user
    resources :posts 
      resources :comments
      resources :likes
end