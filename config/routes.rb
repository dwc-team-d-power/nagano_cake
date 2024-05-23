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
    get '/about', to: 'homes#about', as: 'about'

    resources :items, only: [:index, :show]

    resource :customer, only: [] do
      get 'my_page', to: 'customers#my_page', as: 'my_page'
      get 'information/edit', to: 'customers#edit', as: 'edit_information'
      patch 'information', to: 'customers#update', as: 'information'
      get 'unsubscribe', to: 'customers#unsubscribe', as: 'unsubscribe'
      patch 'withdraw', to: 'customers#withdraw', as: 'withdraw'
    end

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
