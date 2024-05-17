Rails.application.routes.draw do
<<<<<<< HEAD
  #管理者用
  #URL /admin/sign_in ...
  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions:"admin/sessions"
  }
  
  # 顧客用
  # URL　/users/sign_in ...
  devise_for :users,skip:[:passwords],controllers:{
    registrations:"public/registrations",
    sessions:'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
=======
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  
  namespace :admin do
    root 'homes#top'
  end
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end
  end

 scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about', as: 'about'
  end
  scope module: :public do
    resources :items, only: [:index, :show]
  end
  scope module: :public do
    get 'customers/my_page' => 'customers#my_page', as: 'customer_my_page'
    get 'customers/information/edit' => 'customers#information_edit', as: 'edit_customer_information'
    patch 'customers/information/edit' => 'customers#update', as: 'update_customer_information/'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'customer_unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'customer_withdraw'
  end
  scope module: :public do
    resources :cart_items, only: [:index, :update, :destroy, :create]
    get 'cart_items/destroy_all'
  end
  scope module: :public do
    resources :orders, only: [:new, :create, :index, :show]
    get 'orders/confirm'
    get 'orders/thanks'
  end
  scope module: :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
<<<<<<< HEAD
end
=======
>>>>>>> origin/sakamoto
end
>>>>>>> d69b0a6a577f4bfacf493168e4d85500223be6fb
