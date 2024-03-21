Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #users

  resources :users
  post '/promote/:id',to: 'users#promote_to_admin'
  post '/remove/:id',to: 'users#remove_admin'
  post '/change/:id',to: 'users#admin_status'
  post '/delete/:id',to: 'users#change_deleted'

  # products
  resources :products
  get '/prodcat/:id', to: 'products#get_product_by_category'
end
