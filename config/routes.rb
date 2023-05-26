Rails.application.routes.draw do
  resources :foods, only: [:index, :new, :create, :destroy]
  
  resources :recipes, only: [:index, :show, :destroy]
  root "recipes#public_recipes"
  get '/public_recipes', to: 'recipes#public_recipes'
  get '/general_shopping_list', to: 'foods#general_shopping_list'
  
  devise_for :users
end
