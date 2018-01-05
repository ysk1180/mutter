Rails.application.routes.draw do
  resources :contacts
  resources :favorites, only: [:create, :destroy]
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :mutters do
    collection do
      post :confirm
    end
  end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
