Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "welcome#home"
  get '/auth/facebook/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/pleaselogin' => 'sessions#force_log_in', as: "force_log_in"
  
  get '/clearcartid' => 'admin/carts#clear_cart_id' #temporary thing 

  get '/checkout/address' => 'admin/orders#collect_address', as: "collect_address"
  patch '/checkout/address' => 'admin/orders#update_address_and_first_assos', as: "update_address"
  get '/checkout/shipping' => 'admin/orders#choose_shipping', as: "shipping"
  post '/checkout/shipping' => 'admin/orders#update_shipping', as: "update_shipping"
  get '/checkout/payment' => 'admin/orders#payment', as: "payment"
  post '/checkout/finalize_order' => 'admin/orders#finalize_order', as: "finalize_order"


  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

    scope module: 'admin' do 
      #i'm trying to link to module admin without having the ../admin/.. in my url
      #this is not the same as scope '/admin', module: 'admin' do.
      resources :categories, only: [:show]
      resources :products, only: [:show] do
        resources :reviews, only: [:new, :create, :show, :edit, :update]
      end

      resource :cart, only: [:show, :update]
      resources :orders, only: [:show] 
    end


      #this is NOT a mistake/duplicate. dont delete.
  #namespace :admin do
  scope '/admin', module: 'admin' do #trying this new thing, lets see if it works

    resources :categories, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :products, only: [:new, :index] #still in the productscontroller
    end

    resources :products, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :cart_items, only: [:create]
  end




end
