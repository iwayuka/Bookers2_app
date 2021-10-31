Rails.application.routes.draw do
  # ユーザー認証機能のルーティング設定
  devise_for :users

  # トップのURLを「https://〜amazonaws.com/」で表示されるようにする（ルート設定）
  root to: 'homes#top'

  # Bookのルーティング設定
  resources :books

  # Userのルーティング設定
  resources :users, only: [:index, :show, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
