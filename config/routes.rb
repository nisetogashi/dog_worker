Rails.application.routes.draw do
  devise_for :customers
  root to: 'homes#top'
  patch 'customers/:id/image' => 'customers#update_image',  as: 'customer_image'
  # patch 'customers/sitter/:id' => 'customers#update_sitter', as: 'update_sitter_customer_patch'
  # post 'customers/sitter/:id/edit' => 'customers#edit_sitter', as: 'edit_sitter_customer_post'
  # post 'customers/sitter/:id' => 'customers#sitter_show', as: 'sitter_customer_post'
  # get 'customers/sitter/:id' => 'customers#sitter_show', as: 'sitter_customer'
  # get 'customers/sitter/:id/edit' => 'customers#sitter_edit', as: 'edit_sitter_customer'
  resources :my_reservations, only: [:index, :update]
  resources :customers, only: [:new, :show, :index, :edit, :update] do
    resources :sitters do
       resources :favorites, only: [:create, :destroy, :index]
       resources :reservations
       resources :reviews, only: [:new, :create, :destroy]
    end
  end
  get 'reservations' => 'reservations#list', as: 'reservation_lists'
  resources :pets, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :customer_rooms, only: [:show, :create]
  post 'customers_room/:id' => 'customer_room#show', as: 'customer_room_show'
  resources :chats, only: [:create, :show]
  # get 'reservations/:id' => 'reservations#index', as: 'reservations_the'
  # For details on the DSL within this file, see http://guides.rubyonrails.org/routing.html
end