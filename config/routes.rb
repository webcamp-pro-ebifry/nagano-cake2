Rails.application.routes.draw do
  resource :users
  devise_for :admins, controllers:{
  	sessions: 'admins/sessions'
  }
  devise_for :users
  
  get 'homes/top' => 'homes#top'
  root 'homes#top'
  resources :cart_items
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
