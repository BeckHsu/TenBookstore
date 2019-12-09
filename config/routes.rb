Rails.application.routes.draw do
  
  devise_for :users,controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }
  resources :books, except: [:new, :create]   #,path: 'products'  # 8 routes => 7 actions
  resources :publishers, only: [:show]
  root 'books#index'
  
  namespace :admin do
    root 'books#index'
    resources :books
    resources :publishers, except: [:show]

    
  end
end
