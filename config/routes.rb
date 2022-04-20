Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
 registrations: "customer/registrations",
 sessions: 'customer/sessions'
}
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
 sessions: "admin/sessions"
}
namespace :admin do
  resources :genres, only: [:index, :create, :edit, :update]
  resources :products, only: [:new, :index, :create, :show, :edit, :update]
  resources :orders, only: [:show, :update, :index]
  resources :order_items, only: [:update]
  resources :customers, only: [:index, :show, :edit, :update]
 end
 scope module: "customer" do
  root to: 'products#top'
  get 'about' => 'products#about', as: 'about'
  #get "/sign_out" => "sessions#destroy" #要相談
  get "/customers/my_page" => "customers#show" #会員情報詳細ページ（マイページ）表示
  get "/customers/confirm" => "customers#confirm" #退会確認画面の表示
  patch "/customers/out" => "customers#out" #退会フラグを切り替える
  get "/orders/thanks" => "orders#thanks" #注文完了画面を表示する
  post "/orders/confirm" => "orders#confirm" #注文情報確認画面を表示する
  resources :products, only: [:index,:show]
  resources :genres, only: [:show]
  resources :customers, only: [:edit,:update]
  resources :cart_items, only: [:index,:update,:destroy,:create] do
   collection do #:idをつけないように!!
    delete :destroy_all #カートを空にする
   end
  end
   resources :orders, only: [:index,:show,:new,:create,] do
    collection do
     get :thanks
    end
   end
   resources :addresses, only: [:index,:create,:destroy,:edit,:update]
  end
# ここまで↑↑ 会員
end