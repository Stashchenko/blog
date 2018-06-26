Rails.application.routes.draw do

  resources :friendships
  root 'articles#index'
  resources :articles
  resources :comments
  devise_for :users

  get :gem_list, controller:"info"
  get :users_list, controller:"info"
  post :add_to_friends, controller: "friendships"
  get :sent_friendships, controller: "info"
  get :received_friendships, controller: "info"
  post :destroy, controller: "friendships"
  post :approve_friendship, controller: "friendships"
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
end
