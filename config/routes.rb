Rails.application.routes.draw do
  devise_for :users
  root to: 'plans#index'
  resources :plans do
    collection do
      get 'menmacro'
      get 'wmacro'
    end
  end
  resources :users, only: :show
end
