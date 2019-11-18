Rails.application.routes.draw do
  
  resources :books #,path: 'products'  # 8 routes => 7 actions
  root 'books#index'

end
