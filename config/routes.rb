Rails.application.routes.draw do
  devise_for :users
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :recipes do
    resources :recipe_foods
  end
  # Defines the root path route ("/")
  # root "devise/sessions#create"
end
