Rails.application.routes.draw do
  devise_for :members, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  root to: 'homes#top'
  get 'about' => 'homes#about'

  namespace :public, path: '' do
    get 'mypage' => 'members#mypage', as: 'mypage'

    #会員・レビュー検索
    get 'search' => 'searches#search'

    #ジャンル検索
    get 'genre_search' => 'searches#genre_search'
    
    resources :members, only: [:show, :edit, :update] do
      patch :withdraw
    end
    
    resources :reviews do
      resources :review_comments, only: [:create, :destroy]
    end
  end

  namespace :admin do
    resources :members, only: [:index, :edit, :update]

    root to: 'members#index'

    resources :genres, except: [:new, :show]

    resources :reviews, except: [:new, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
