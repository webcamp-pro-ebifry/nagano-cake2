Rails.application.routes.draw do
  devise_for :admins, controllers:{
  	sessions: 'admins/sessions'
  }
  devise_for :users
  resource :users
  get 'homes/top' => 'homes#top'
  root 'homes#top'
  resources :shipping_addresses , only: [:index, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
