Rails.application.routes.draw do
  devise_for :admins, controllers:{
  	sessions: 'admins/sessions'
  }
  devise_for :users
  get 'homes/top' => 'homes#top'
  root 'homes#top'
  get 'users/withdrawal' => 'users#withdrawal'
  resources :users, only:[:show ,:edit,:update]

end
