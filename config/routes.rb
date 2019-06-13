Rails.application.routes.draw do
  get 'blog/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'top#index'
  get 'inquiry' => 'inquiry#index'              # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面
  get 'introduction' => 'introductions#index'
  get 'login' => 'sessions#login_form'

  resource :session, only:[:create, :destroy]
  resource :account, only:[:show, :edit, :update]
  resource :password, only:[:show, :edit, :update]

  # 会員ごとの記事一覧だけネスとされたリソース
  resources :members do
    resources :entries, only:[:index]
  end

  resources :articles
  resources :entries
end
