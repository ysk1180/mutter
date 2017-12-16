Rails.application.routes.draw do
  root to: 'mutters#index'
  resources :mutters do
    collection do
      post :confirm
    end
  end
end
