Rails.application.routes.draw do
  devise_for :admin
  devise_for :customers

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :items, only: [:index, :show, :new, :create, :edit, :update]

    resources :orders, only: [:show, :update] do
      resources :order_items, only: [:update]
    end

  end

  scope module: :public do
    root to: 'homes#top'
    get "about" => "homes#about"

    resources :items, only: [:index, :show]

    resources :cart_items, only: [:index, :create, :update ,:destroy]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'

    resources :orders, only: [:index, :show, :create, :new] do
      collection do
        post :confirm
        get :complete
      end
    end

    resources :addresses, only: [:index, :create, :destroy, :edit, :update]

    resources :customers, only: [:show, :edit, :update] do
      member do
        get :quit_confirm
        patch :quit
      end
    end

  end
end
