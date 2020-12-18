Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "welcome#home"
  get '/auth/facebook/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/checkout' => 'admin/orders#new'
  get '/checkout/shipping' => 'admin/carts#shipping', as: "shipping"


  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

    scope module: 'admin' do 
      #i'm trying to link to module admin without having the ../admin/.. in my url
      #this is not the same as scope '/admin', module: 'admin' do.
      resources :categories, only: [:show]
      resources :products, only: [:show]
      resource :cart, only: [:show]
      resources :orders, only: [:create] 


    end


  namespace :admin do
    resources :categories, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :products, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :cart_items, only: [:create]
  end




end
