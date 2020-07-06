Rails.application.routes.draw do

  namespace :admins do
   resources :users, only: [:index,:show,:edit,:update]
  end

  devise_for :admins, controllers:{
  	sessions: 'admins/sessions'
  }
  devise_for :users
  resource :users
  get 'homes/top' => 'homes#top'
  get 'homes/about' => 'homes#about'

  root 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admins do
    resources :genres
  end
  resources :genres
 
  namespace :admins do
    resources :products
  end

  resources :products, only: [:new, :index,:show,:edit,:update]

end
