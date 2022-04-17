Rails.application.routes.draw do
  namespace :customer do
    get 'adresses/index'
    get 'adresses/edit'
  end
  namespace :customer do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/thanks'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :customer do
    get 'cart_items/index'
  end
  namespace :customer do
    get 'products/top'
    get 'products/about'
    get 'products/index'
    get 'products/show'
  end
  namespace :customer do
    get 'customers/show'
    get 'customers/confirm'
    get 'customers/edit'
  end
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'products/index'
    get 'products/new'
    get 'products/show'
    get 'products/edit'
  end
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
