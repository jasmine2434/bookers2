Rails.application.routes.draw do

  get 'profileimage/new'
  get 'profileimage/index'
  get 'profileimage/show'
  devise_for :users
  root to: "homes#top"
  get 'home/about' => 'homes#about', as: 'about'
  #delete 'books' => 'books#destroy', as: 'destroy'
  #patch 'books' => 'books#update'
  #patch 'users' => 'users#update'
  #delete 'users' => 'users#destroy'

  resources :books#, except: [:new]
  #get 'book/new'
  #get 'book/index'
  #get 'book/show'
  #get 'users/show'
  #get 'users/edit'

  resources :users, only: [:index, :show, :edit, :update]

  resources :profile_image
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
