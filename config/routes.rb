Rails.application.routes.draw do


  namespace :admins do
    resources :order_details, only:[:update]
  end


  get 'users/withdrawal' => 'users#withdrawal'
  resource :users, only:[:show ,:edit,:update,:destroy]


  devise_for :users


  resources :order_details, only: [:index,:show,:create,:update]

  namespace :admins do
   resources :orders, only: [:top,:index,:show,:update]
  end
  resources :orders,only:[:new,:create]
  post "orders/index" => "orders#index"
  get "orders/fin" => "orders#fin"

  namespace :admins do
   resources :users, only: [:index,:show,:edit,:update]
  end


  devise_for :admins, controllers:{
    sessions: 'admins/sessions'
  }

  get 'homes/top' => 'homes#top'
  get 'homes/about' => 'homes#about'
  root 'homes#top'
  get 'admins/homes/top' => 'admins/homes#top'

  resources :shipping_addresses , only: [:index, :create, :edit, :update, :destroy]

  resources :cart_items , only: [:index, :update, :create, :destroy]
  delete 'cart_items_destroy_all' => 'cart_items#destroy_all'


  namespace :admins do
    resources :genres
  end
  resources :genres

  namespace :admins do
    resources :products
  end
  resources :products, only: [:new, :index,:show,:edit,:update ,:create]

end