Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]

  resources :bands, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :albums, only: :new
  end
  
  resources :albums, only: [:show, :create, :edit, :update, :destroy]

  resource :session, only: [:new, :create, :destroy]
end
