Rails.application.routes.draw do

  namespace :admins do
    resources :order_details, only:[:update]
  end
  devise_for :users

  resource :users, only:[:show ,:edit,:update]
   get 'users/withdrawal' => 'users#withdrawal'

  resources :order_details, only: [:index,:show,:create,:update]

  namespace :admins do
   resources :orders, only: [:top,:index,:show,:update]
  end
  namespace :admins do
   resources :users, only: [:index,:show,:edit,:update]
  end


  resources :orders,only:[:new,:create]
  post "orders/index" => "orders#index"
  get "orders/fin" => "orders#fin"


  devise_for :admins, controllers:{
  	sessions: 'admins/sessions'
  }



  get 'homes/top' => 'homes#top'
  get 'homes/about' => 'homes#about'

  root 'homes#top'

  resources :shipping_addresses , only: [:index, :create, :edit, :update, :destroy]

  resources :cart_items

  namespace :admins do
    resources :genres
  end
  resources :genres

  namespace :admins do
    resources :products
  end
  resources :products, only: [:new, :index,:show,:edit,:update ,:create]

end
