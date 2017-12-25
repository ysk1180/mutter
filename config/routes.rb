Rails.application.routes.draw do
  resources :favorites, only: [:create, :destroy]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :mutters do
    collection do
      post :confirm
    end
  end
end
