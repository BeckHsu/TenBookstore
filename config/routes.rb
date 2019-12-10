Rails.application.routes.draw do
  
  devise_for :users,controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }
  resources :books, except: [:new, :create] do
    member do
      post :comment
    end
  end
  #,path: 'products'  # 8 routes => 7 actions
  resources :publishers, only: [:show]
  

  root 'books#index'

  namespace :api do
    resources :books, only: [] do
      member do
        post :favorite 
      end
    end
  end



  namespace :admin do
    root 'books#index'
    resources :books
    resources :publishers, except: [:show]

    
  end
end
