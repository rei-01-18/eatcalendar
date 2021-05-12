Rails.application.routes.draw do
  devise_for :users
  root to: 'plans#index'
  resources :plans do
    resources :likes, only: [:create, :destroy]
    collection do
      get 'men'
      get 'women'
    end
  end
  resources :users, only: :show, :edit
end
