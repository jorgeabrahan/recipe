Rails.application.routes.draw do
  resources :foods, only: [:index, :new, :create, :destroy]
  
  resources :recipes, only: [:index, :new, :create, :show, :destroy]
  root "recipes#public_recipes"
  get '/public_recipes', to: 'recipes#public_recipes'
  get '/general_shopping_list', to: 'foods#general_shopping_list'
  post 'toggle_public', to: 'recipes#toggle'
  devise_for :users
  resources :recipes do
    resources :recipe_foods
  end
end
