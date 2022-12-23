Rails.application.routes.draw do
  devise_for :users

  root to: 'user#index'
  resources :user, only: %i[index show destroy] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy] 
      resources :likes, only: %i[new create destroy]
    end
 end
 namespace :api do
  resources :users, only: [] do
    resources :posts, only: [:index] do
      resources :comments, only: [:index, :create]
    end
  end
end

end