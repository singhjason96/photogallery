Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "sessions#new"
  get "/logout", to: "sessions#destroy", as: :logout
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :albums, only: [:index, :create, :show, :edit, :update, :destroy, :new] do
      resources :photos, only: [:index, :create, :show, :edit, :update, :destroy, :new]
    end
  end
end
