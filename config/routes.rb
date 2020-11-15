Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :orders
    resources :comments

  end
  root to: 'items#index'
end
