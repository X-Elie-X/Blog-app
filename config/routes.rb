Rails.application.routes.draw do

  root to: 'users#index'
  resources :user, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[new create] 
      resources :likes, only: %i[new create]
    end
 end


end