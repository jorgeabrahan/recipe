class RecipesController < ApplicationController
  def index
  end

  def show
  end

  def public_recipes
    @recipes = Recipe.where(public: true)
  end
end
