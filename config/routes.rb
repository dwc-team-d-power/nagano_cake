Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :admin do
    root 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update] do
    resources :order_details, only: [:update]
    end
  end

  scope module: :public do
    root 'homes#top'
    get 'about', to: 'homes#about', as: 'about'
    resources :items, only: [:index, :show]
  end
  
  scope module: :public do
    # get 'customers/my_page' => 'customers#show'
    # get 'customers/information/edit' => 'customers#edit'
    # get 'customers/information' => 'customers#update'
    # get 'customers/unsubscribe'
    # get 'customers/withdraw'

    get 'customers/my_page' => 'customers#my_page', as: 'customer_my_page'
    get 'customers/information/edit' => 'customers#information_edit', as: 'edit_customer_information'
    patch 'customers/information/edit' => 'customers#update', as: 'update_customer_information/'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'customer_unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'customer_withdraw'
  end
  
  scope module: :public do
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items/destroy_all'
  end
  
  scope module: :public do
    post 'orders/confirm' => 'orders#confirm', as: 'orders_confirm'
    get 'orders/thanks' => 'orders#thanks', as: 'orders_thanks'
    resources :orders, only: [:new, :create, :index, :show]
  end
  
  scope module: :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
end

#     resource :customer, only: [] do
#       get 'my_page', to: 'customers#show', as: 'my_page'
#       get 'information/edit', to: 'customers#edit', as: 'edit_information'
#       patch 'information', to: 'customers#update', as: 'information'
#       get 'unsubscribe', to: 'customers#unsubscribe', as: 'unsubscribe'
#       patch 'withdraw', to: 'customers#withdraw', as: 'withdraw'
#     end

#     resources :cart_items, only: [:index, :update, :destroy, :create] do
#       collection do
#         delete 'destroy_all'
#       end
#     end

#     resources :orders, only: [:new, :create, :index, :show] do
#       collection do
#         post 'confirm'
#         get 'thanks'
#       end
#     end
