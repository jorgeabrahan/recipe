Rails.application.routes.draw do
  root "foods#index"
  resources :foods, only: [:index, :new, :create, :destroy]
  devise_for :users
end
