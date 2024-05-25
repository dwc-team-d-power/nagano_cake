Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

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
    get '/about' => 'homes#about', as: 'about'

    resources :items, only: [:index, :show]
    get 'customers/my_page' => 'customers#my_page', as: 'customer_my_page'
    get 'customers/information/edit' => 'customers#information_edit', as: 'edit_customer_information'
    patch 'customers/information/edit' => 'customers#update', as: 'update_customer_information'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'customer_unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'customer_withdraw'

    resources :cart_items, only: [:index, :update, :destroy, :create] do
      collection do
        delete 'destroy_all', to: 'cart_items#destroy_all', as: 'destroy_all'
      end
    end

    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'confirm', to: 'orders#confirm', as: 'confirm'
        get 'thanks', to: 'orders#thanks', as: 'thanks'
      end
    end

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  get 'search' => "searches#search"
end