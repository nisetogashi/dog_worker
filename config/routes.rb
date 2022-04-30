Rails.application.routes.draw do
  devise_for :customers
  root to: 'homes#top'
  patch 'customers/:id/image' => 'customers#update_image',  as: 'customer_image'
  patch 'customers/sitter/:id' => 'customers#update_sitter', as: 'update_sitter_customer_patch'
  post 'customers/sitter/:id/edit' => 'customers#edit_sitter', as: 'edit_sitter_customer_post'
  post 'customers/sitter/:id' => 'customers#sitter_show', as: 'sitter_customer_post'
  get 'customers/sitter/:id' => 'customers#sitter_show', as: 'sitter_customer'
  get 'customers/sitter/:id/edit' => 'customers#sitter_edit', as: 'edit_sitter_customer'
  get 'customer/calendar/:id' => 'customer#calendar', as: 'customer_calendar'
  get 'customer/sitter/:id' => 'customers#sitter_show_for_customer', as: 'sitter_show_for_customer'
  resources :customers, only: [:new, :show, :index, :edit, :update]
  resources :pets, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :chat_rooms do
    resources :messages
  end
  # For details on the DSL within this file, see http://guides.rubyonrails.org/routing.html
end