Rails.application.routes.draw do
  root 'feeds#show'
  devise_for :users
  resources :users, only: [:index, :show, :current_user_home] do
    resources :sent_requests
    resources :received_requests
    resources :friendships
    resources :posts
    resource :profiles, only: [:edit, :create, :update, :delete]
  end
  resources :posts do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  
  resource :notification
  resource :feed
  get 'welcome/index' #For signup/signin

 
end
